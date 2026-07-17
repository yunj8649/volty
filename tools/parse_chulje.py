"""전기기사 출제기준(필기) PDF -> 개념 분류 트리(JSON).

공단 출제기준은 4단계 계층이다:
    필기과목명 -> 주요항목 -> 세부항목 -> 세세항목
이 트리가 앱의 개념 태그 체계 원본이 된다.

주의사항 세 가지 (전부 실제로 데인 것들):

1. pdftotext -layout 은 쓸 수 없다. 한글이 화면상 2칸인데 문자 인덱스로는
   1칸이라 줄마다 컬럼 정렬이 어긋난다. 표 인식(pdfplumber)이어야 한다.
2. 이 PDF는 45p 중 뒷부분이 '실기' 출제기준이다. 실기 과목명은 필기 과목
   목록에 없어서, 그냥 파싱하면 직전 필기 과목에 계속 누적된다. 잘라내야 한다.
3. 셀 안에서 글자 단위로 줄바꿈이 일어나고, 그 지점의 공백이 소실된다.
   '점전하에 의'+'한 전계'는 붙여야 하고(의한), '전계의'+'세기'는 띄워야 하는데
   이건 좌표로 복원되지 않는다. 실측해보면 '정전에너/지'(붙임)의 남은폭이 11.6,
   '전계의/세기'(띄움)가 11.0으로 오히려 붙일 쪽이 더 넓다. 후행 공백 문자도
   단 한 건도 보존되지 않는다. 그래서 붙여쓰기를 기본으로 하고 공백이 필요한
   139개 중 51개를 label-fixes.json 에 명시했다.
"""
import json
import re
import sys
from pathlib import Path

import pdfplumber

SRC = Path(sys.argv[1] if len(sys.argv) > 1
           else "/Users/yunjeong/개인/전기기사/전기기사 출제기준 (필기).pdf")
OUT = Path(sys.argv[2] if len(sys.argv) > 2
           else Path(__file__).parent.parent / "data/taxonomy/chulje-2024-2026.json")

NUM = re.compile(r"^\s*(\d+)\.?\s+(.*)$", re.S)  # PDF 오타로 마침표 빠진 번호가 있다
SUBJECTS = {
    "전기자기학": "전기자기학",
    "전력공학": "전력공학",
    "전기기기": "전기기기",
    "회로이론": "회로이론 및 제어공학",
    "전기설비기술기준": "전기설비기술기준",
}


FIXES = json.loads((Path(__file__).parent.parent /
                    "data/taxonomy/label-fixes.json").read_text(encoding="utf-8"))["fixes"]
used_fixes = set()


def join_wrapped(page, cell):
    """셀 텍스트를 한 줄로 만든다. 折행 지점은 공백 없이 붙인다."""
    crop = page.crop(cell)
    lines = {}
    for ch in crop.chars:
        lines.setdefault(round(ch["top"]), []).append(ch)
    if not lines:
        return ""
    parts = ["".join(c["text"] for c in sorted(lines[y], key=lambda c: c["x0"])).strip()
             for y in sorted(lines)]
    return re.sub(r"\s+", " ", "".join(p for p in parts if p)).strip()


def fix_label(text):
    """복원 불가능한 折행 공백을 교정표로 되돌린다."""
    if text in FIXES:
        used_fixes.add(text)
        return FIXES[text]
    return text


def parse(path):
    tree, subject = {}, None
    cur_major = cur_minor = None

    with pdfplumber.open(path) as pdf:
        for page in pdf.pages:
            if "실기과목명" in (page.extract_text() or ""):
                break  # 여기부터 실기 출제기준 — 필기만 필요하다

            tables = [t for t in page.find_tables() if len(t.columns) == 5]
            if not tables:
                continue

            for row in tables[0].rows:
                cells = [join_wrapped(page, c) if c else "" for c in row.cells]
                if len(cells) < 5 or cells[0] == "필기과목명":
                    continue
                name, _, major, minor, micro = cells[:5]

                for key, full in SUBJECTS.items():
                    if name.startswith(key):
                        if subject != full:
                            subject = full
                            tree.setdefault(subject, {})
                            cur_major = cur_minor = None
                        break
                if subject is None:
                    continue

                if major and (m := NUM.match(major)):
                    cur_major = fix_label(m.group(2).strip())
                    tree[subject].setdefault(cur_major, {})
                    cur_minor = None
                if minor and (m := NUM.match(minor)) and cur_major:
                    cur_minor = fix_label(m.group(2).strip())
                    tree[subject][cur_major].setdefault(cur_minor, [])
                if micro and (m := NUM.match(micro)) and cur_major and cur_minor:
                    item = fix_label(m.group(2).strip())
                    bucket = tree[subject][cur_major][cur_minor]
                    if item not in bucket:
                        bucket.append(item)
    return tree


if __name__ == "__main__":
    tree = parse(SRC)

    print(f"{'과목':<22}{'주요':>5}{'세부':>6}{'세세':>6}")
    print("-" * 41)
    tot = [0, 0, 0]
    for subj, majors in tree.items():
        a = len(majors)
        b = sum(len(v) for v in majors.values())
        c = sum(len(m) for v in majors.values() for m in v.values())
        tot = [tot[0] + a, tot[1] + b, tot[2] + c]
        print(f"{subj:<20}{a:>5}{b:>6}{c:>6}")
    print("-" * 41)
    print(f"{'합계':<20}{tot[0]:>5}{tot[1]:>6}{tot[2]:>6}")

    # 교정표가 PDF와 어긋나면 조용히 넘어가지 말고 알린다
    stale = set(FIXES) - used_fixes
    if stale:
        print(f"\n[warn] label-fixes.json 에 안 쓰인 항목 {len(stale)}개 — PDF와 어긋남:")
        for s in sorted(stale):
            print(f"    {s!r}")
    else:
        print(f"\n교정표 {len(used_fixes)}개 전부 적용됨")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(tree, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"-> {OUT}")
