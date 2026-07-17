"""출제기준 트리 -> 앱이 읽는 taxonomy.json.

parse_chulje.py 가 뽑은 중첩 dict를 평평한 노드 목록으로 바꾸고 안정적인 ID를 붙인다.

ID는 위치 기반이다 (em.1.4.3 = 전기자기학 > 1번 주요항목 > 4번 세부항목 > 3번 세세항목).
학습 기록이 이 ID에 매달리므로 라벨 띄어쓰기가 바뀌어도 ID는 유지돼야 한다.
출제기준이 개정되면(현재 판 적용기간 2026.12.31) 번호가 밀릴 수 있으니,
그때는 마이그레이션 표가 필요하다 — 라벨로 매칭하면 된다.
"""
import json
from pathlib import Path

ROOT = Path(__file__).parent.parent
SRC = ROOT / "data/taxonomy/chulje-2024-2026.json"
OUT = ROOT / "app/assets/taxonomy.json"

# 과목별 코드와 문항수 (출제기준상 5과목 각 20문항, 총 100문항)
SUBJECTS = {
    "전기자기학": ("em", 20),
    "전력공학": ("pw", 20),
    "전기기기": ("mc", 20),
    "회로이론 및 제어공학": ("ct", 20),
    "전기설비기술기준": ("kec", 20),
}

tree = json.loads(SRC.read_text(encoding="utf-8"))

subjects = []
total_concepts = 0
for name, majors in tree.items():
    code, qcount = SUBJECTS[name]
    major_list = []
    for mi, (major_name, minors) in enumerate(majors.items(), 1):
        minor_list = []
        for ni, (minor_name, micros) in enumerate(minors.items(), 1):
            concepts = [
                {"id": f"{code}.{mi}.{ni}.{ci}", "name": micro}
                for ci, micro in enumerate(micros, 1)
            ]
            total_concepts += len(concepts)
            minor_list.append({
                "id": f"{code}.{mi}.{ni}",
                "name": minor_name,
                "concepts": concepts,
            })
        major_list.append({
            "id": f"{code}.{mi}",
            "name": major_name,
            "minors": minor_list,
        })
    subjects.append({
        "id": code,
        "name": name,
        "questionCount": qcount,
        "majors": major_list,
    })

doc = {
    "version": "2024-2026",
    "source": "한국산업인력공단 전기기사 출제기준(필기), 적용기간 2024.01.01~2026.12.31",
    "passRule": {"averageMin": 60, "perSubjectMin": 40},
    "subjects": subjects,
}

OUT.parent.mkdir(parents=True, exist_ok=True)
OUT.write_text(json.dumps(doc, ensure_ascii=False, indent=2), encoding="utf-8")

print(f"과목 {len(subjects)} / 개념 {total_concepts}개 -> {OUT}")
for s in subjects:
    n = sum(len(mi["concepts"]) for ma in s["majors"] for mi in ma["minors"])
    print(f"  {s['id']:4s} {s['name']:<16} 개념 {n:3d}")

ids = [c["id"] for s in subjects for ma in s["majors"] for mi in ma["minors"] for c in mi["concepts"]]
assert len(ids) == len(set(ids)), "개념 ID 중복"
print(f"\nID 유일성 확인: {len(ids)}개 전부 유일")
