"""이론 카드(Markdown + YAML frontmatter) -> 앱 에셋(JSON).

카드 단위는 세부항목이다. data/cards/README.md 참고.

taxonomy 와 어긋나면 실패시킨다 — 카드 ID가 오타이거나, covers 가 실제 세세항목과
다르거나, 세세항목을 빠뜨렸으면 조용히 넘어가지 않는다. 학습 기록이 이 ID에
매달리므로 어긋난 채로 빌드되면 안 된다.
"""
import json
import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).parent.parent
CARDS_DIR = ROOT / "data/cards"
TAXONOMY = ROOT / "app/assets/taxonomy.json"
OUT = ROOT / "app/assets/cards.json"

FRONTMATTER = re.compile(r"^---\n(.*?)\n---\n(.*)$", re.S)
REQUIRED = ("id", "title", "status", "summary", "covers")
VALID_STATUS = ("draft", "reviewed")


def load_taxonomy():
    """세부항목 ID -> (과목, 경로, 세세항목 ID 집합, 세세항목 이름 맵)"""
    doc = json.loads(TAXONOMY.read_text(encoding="utf-8"))
    minors = {}
    for s in doc["subjects"]:
        for ma in s["majors"]:
            for mi in ma["minors"]:
                minors[mi["id"]] = {
                    "subject": s["id"],
                    "subjectName": s["name"],
                    "path": [s["name"], ma["name"], mi["name"]],
                    "conceptIds": [c["id"] for c in mi["concepts"]],
                    "conceptNames": {c["id"]: c["name"] for c in mi["concepts"]},
                }
    return minors


def norm_heading(s):
    """세세항목 이름과 ## 섹션 제목을 비교하기 위해 정규화한다.

    출제기준의 세세항목은 상당수가 '~ 등' 으로 끝난다(공단이 목록을 열어둔 것).
    카드 섹션 제목까지 '등' 을 달 이유는 없으므로 떼고 비교한다.
    """
    return re.sub(r"\s*등$", "", s).strip()


def tex_unbalanced(tex):
    r"""LaTeX 중괄호 균형을 본다. 안 맞으면 True.

    KaTeX는 중괄호가 안 맞으면 렌더링에서 조용히 깨지는데, YAML도 마크다운도
    이걸 못 잡는다. 빌드가 통과한 뒤 화면에서야 발견되니 여기서 잡는다.
    `\{` `\}` 는 리터럴 중괄호라 세면 안 된다.
    """
    t = re.sub(r"\\[{}]", "", tex)
    depth = 0
    for ch in t:
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth < 0:
                return True
    return depth != 0


def find_tex(body):
    r"""본문의 $$블록$$ 과 $인라인$ 수식을 뽑는다.

    인라인 수식은 줄바꿈을 넘나들 수 있어서(카드를 쓰다 보면 자연히 그렇게 된다)
    블록을 먼저 걷어낸 뒤 본문을 평탄화해서 찾는다.
    """
    flat = body.replace("\n", " ")
    for m in re.finditer(r"\$\$(.+?)\$\$", flat, re.S):
        yield m.group(1)
    for m in re.finditer(r"(?<!\$)\$([^$]+?)\$(?!\$)", re.sub(r"\$\$.+?\$\$", "", flat, flags=re.S)):
        yield m.group(1)


def split_sections(body):
    """'## 제목' 단위로 본문을 자른다."""
    parts = re.split(r"^##\s+(.+?)\s*$", body, flags=re.M)
    if len(parts) < 3:
        text = body.strip()
        return [{"heading": "", "body": text}] if text else []
    out = []
    for i in range(1, len(parts), 2):
        out.append({"heading": parts[i].strip(), "body": parts[i + 1].strip()})
    return out


def main():
    minors = load_taxonomy()
    errors, warnings, cards = [], [], []

    for path in sorted(CARDS_DIR.glob("*/*.md")):
        raw = path.read_text(encoding="utf-8")
        m = FRONTMATTER.match(raw)
        if not m:
            errors.append(f"{path.name}: frontmatter(---) 없음")
            continue

        # YAML은 몇몇 문자로 시작하는 값을 특수 문법으로 읽는다. 카드를 쓰다 보면
        # 반복해서 밟으니 원인을 정확히 짚어준다.
        #   '*' -> 앵커 별칭 ('scanning an alias' 라는 알아보기 힘든 오류)
        #   '%' -> 디렉티브,  '&' -> 앵커,  '!' -> 태그
        # 목록 항목('- **')과 키 값('note: **') 양쪽에서 나온다.
        BAD_START = {
            "*": "앵커 별칭", "%": "디렉티브", "&": "앵커", "!": "태그",
            "|": "블록 스칼라", ">": "접힌 블록 스칼라",
            "@": "예약 문자", "`": "예약 문자",
        }
        for n, line in enumerate(m.group(1).split("\n"), 1):
            mm = re.match(r"^\s*(?:-|[\w]+:)\s+([*%&!|>@`])", line)
            if mm:
                ch = mm.group(1)
                errors.append(
                    f"{path.name}:{n + 1}: 값이 '{ch}' 로 시작하면 따옴표로 감싸야 한다 "
                    f"(YAML이 '{ch}' 를 {BAD_START[ch]}로 읽는다)\n"
                    f"        {line.strip()[:60]}")

            # 값 안의 ': ' (콜론+공백)도 키-값 구분자로 읽혀서 깨진다.
            # `tex: \text{일반: } O - CO` 같은 게 걸린다.
            mv = re.match(r"^\s*(?:-\s+)?[\w]+:\s+(?![\"'])(.*)$", line)
            if mv and re.search(r":\s", mv.group(1)):
                errors.append(
                    f"{path.name}:{n + 1}: 값 안에 ': '(콜론+공백)가 있으면 따옴표로 감싸야 한다 "
                    f"(YAML이 키-값 구분자로 읽는다)\n"
                    f"        {line.strip()[:60]}")

            # KaTeX 수식의 중괄호가 안 맞으면 화면에서만 깨진다. 여기서 잡는다.
            mt = re.match(r"^\s*tex:\s*(.*?)\s*$", line)
            if mt:
                t = mt.group(1)
                if len(t) > 1 and t[0] == t[-1] and t[0] in "\"'":
                    t = t[1:-1]
                if tex_unbalanced(t):
                    errors.append(
                        f"{path.name}:{n + 1}: LaTeX 중괄호가 안 맞는다 "
                        f"(KaTeX가 렌더링에서 조용히 깨진다)\n"
                        f"        {line.strip()[:60]}")

        try:
            meta = yaml.safe_load(m.group(1)) or {}
        except yaml.YAMLError as e:
            if not any(path.name in e2 for e2 in errors):
                errors.append(f"{path.name}: YAML 오류 — {e}")
            continue

        missing = [k for k in REQUIRED if not meta.get(k)]
        if missing:
            errors.append(f"{path.name}: 필수 필드 없음 — {', '.join(missing)}")
            continue

        cid = meta["id"]
        if cid not in minors:
            errors.append(f"{path.name}: id '{cid}' 가 taxonomy 에 없음")
            continue
        if path.stem != cid:
            errors.append(f"{path.name}: 파일명과 id '{cid}' 불일치")
        if meta["status"] not in VALID_STATUS:
            errors.append(f"{path.name}: status '{meta['status']}' — {VALID_STATUS} 중 하나여야 함")

        info = minors[cid]
        if path.parent.name != info["subject"]:
            errors.append(
                f"{path.name}: 과목 폴더가 '{path.parent.name}' 인데 taxonomy 상 '{info['subject']}'")

        covers = list(meta["covers"])
        unknown = [c for c in covers if c not in info["conceptIds"]]
        if unknown:
            errors.append(f"{path.name}: covers 에 없는 세세항목 — {unknown}")
        uncovered = [c for c in info["conceptIds"] if c not in covers]
        if uncovered:
            names = [f"{c}({info['conceptNames'][c]})" for c in uncovered]
            warnings.append(f"{path.name}: 안 덮은 세세항목 — {', '.join(names)}")

        for r in meta.get("related", []) or []:
            if r not in minors:
                warnings.append(f"{path.name}: related '{r}' 가 taxonomy 에 없음")

        for tex in find_tex(m.group(2)):
            if tex_unbalanced(tex):
                errors.append(
                    f"{path.name}: 본문 LaTeX 중괄호가 안 맞는다 "
                    f"(KaTeX가 렌더링에서 조용히 깨진다)\n"
                    f"        {tex.strip()[:70]}")

        # 렌더러(card_body.dart)는 '### ' 까지만 소제목으로 처리한다. '#### ' 는
        # 그냥 문단이 되어 화면에 '#### 제목' 이 날것으로 찍힌다. 빌드가 안 잡으면
        # 화면을 봐야만 아는 종류라 여기서 막는다.
        for n, line in enumerate(m.group(2).split("\n"), 1):
            if re.match(r"^#{4,}\s", line):
                errors.append(
                    f"{path.name}: '{line.split()[0]}' 는 렌더러가 소제목으로 "
                    f"처리하지 않는다 — '## ' 나 '### ' 까지만 쓸 것\n"
                    f"        {line.strip()[:60]}")

        # \text{...} 를 쓰다 줄바꿈이 끼는 실수를 반복해서 했다. 렌더링은 되지만
        # (줄바꿈이 공백이 된다) 의도한 적이 없고 소스가 지저분해진다.
        for mm in re.finditer(r"\\text(?:bf|rm|it)?\{[^{}]*\n", m.group(2)):
            n = m.group(2)[:mm.start()].count("\n") + 1
            warnings.append(
                f"{path.name}:{n}: \\text{{...}} 안에서 줄이 바뀐다 — 한 줄로 쓸 것\n"
                f"        {mm.group(0).strip()[:60]}")

        # 표(| a | b |)는 렌더러(card_body.dart)가 Flutter Table 위젯으로 그린다.
        # 행마다 셀 수가 다르면 런타임에서 throw 하고, 셀을 '|' 로 split 하므로
        # 셀 안의 리터럴 '|'($|V|$, \Big|, \|z\| 등)가 있으면 셀이 잘못 쪼개진다.
        # 둘 다 화면을 봐야만 아는 종류라 여기서 막는다. (\lvert..\rvert, \Big\vert 로 쓸 것)
        body_no_block = re.sub(r"\$\$.+?\$\$", "", m.group(2), flags=re.DOTALL)
        for para in re.split(r"\n\s*\n", body_no_block):
            plines = [l for l in para.split("\n") if l.strip()]
            if not plines or not all(l.strip().startswith("|") for l in plines):
                continue
            widths = []
            for l in plines:
                t = l.strip()
                if re.match(r"^\|[\s\-:|]+\|$", t):
                    continue  # 구분선
                widths.append(len(t.split("|")) - 2)
                if any("|" in x for x in re.findall(r"\$([^$]*)\$", t)):
                    errors.append(
                        f"{path.name}: 표 셀의 수식 안에 리터럴 '|' 가 있다 — "
                        f"셀이 잘못 쪼개진다 (\\lvert..\\rvert · \\Big\\vert 로 쓸 것)\n"
                        f"        {t[:70]}")
            if len(set(widths)) > 1:
                errors.append(
                    f"{path.name}: 표의 행마다 셀 수가 다르다 {sorted(set(widths))} — "
                    f"Flutter Table 이 렌더링에서 throw 한다\n"
                    f"        {plines[0].strip()[:70]}")

        # ·(U+00B7)는 flutter_math_fork 수식 모드에서 렌더 실패(빨간 원문). 수식 안에서는
        # ・(U+30FB)를 써야 한다. tex 프론트매터와 본문 $…$/$$…$$ 안의 · 를 잡는다.
        # (프로즈·제목의 · 는 출제기준 개념명과 매칭돼야 하므로 건드리지 않는다.)
        for tex in find_tex(m.group(2)):
            if "·" in tex:
                errors.append(
                    f"{path.name}: 수식 안에 ·(U+00B7)가 있다 — 렌더가 깨진다. "
                    f"・(U+30FB)로 쓸 것\n        {tex.strip()[:60]}")
        for line in m.group(1).split("\n"):
            ls = line.strip()
            if ls.startswith("tex:") and "·" in ls:
                errors.append(
                    f"{path.name}: frontmatter tex: 에 ·(U+00B7)가 있다 — "
                    f"・(U+30FB)로 쓸 것\n        {ls[:60]}")

        sections = split_sections(m.group(2))
        headings = {norm_heading(s["heading"]) for s in sections}
        # 세세항목이 하나뿐이면 카드 전체가 곧 그 항목이라 섹션 검사가 무의미하다.
        # 그런 주요항목이 21개 있고, 이름도 '단락현상에 관한사항', '종류', '~의
        # 일반사항' 같은 상투어라 억지로 맞춘 ## 제목이 오히려 카드를 망친다.
        # 여러 개일 때만 검사한다 — 그때는 하나를 빠뜨릴 수 있으니 검사가 값을 한다.
        if len(info["conceptIds"]) > 1:
            # unknown 은 위에서 이미 오류로 잡았다. 여기서 다시 조회하면 터진다.
            for c in (c for c in covers if c in info["conceptNames"]):
                name = info["conceptNames"][c]
                if norm_heading(name) not in headings:
                    warnings.append(
                        f"{path.name}: 세세항목 '{name}' 를 다루는 ## 섹션이 없음")

        cards.append({
            "id": cid,
            "title": meta["title"],
            "status": meta["status"],
            "subject": info["subject"],
            "path": info["path"],
            "summary": meta["summary"],
            "covers": covers,
            "formulas": meta.get("formulas") or [],
            "traps": meta.get("traps") or [],
            "related": meta.get("related") or [],
            "sections": sections,
        })

    for w in warnings:
        print(f"[warn] {w}")
    for e in errors:
        print(f"[ERROR] {e}")
    if errors:
        print(f"\n{len(errors)}개 오류 — 빌드 중단")
        return 1

    OUT.write_text(
        json.dumps({"cards": cards}, ensure_ascii=False, indent=2), encoding="utf-8")

    done = sum(1 for c in cards if c["status"] == "reviewed")
    print(f"\n카드 {len(cards)}/{len(minors)}장 (검수 완료 {done}장) -> {OUT}")
    by_subject = {}
    for c in cards:
        by_subject[c["subject"]] = by_subject.get(c["subject"], 0) + 1
    total = {}
    for mid, info in minors.items():
        total[info["subject"]] = total.get(info["subject"], 0) + 1
    for s in total:
        print(f"  {s:4s} {by_subject.get(s, 0):3d} / {total[s]:3d}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
