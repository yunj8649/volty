#!/bin/sh
# 카드를 빌드하고 결과를 요약한다.
#
# 왜 이 스크립트가 있나: `python3 tools/build_cards.py | tail -7` 로 확인하다가
# 경고를 두 번 놓쳤다.
#   1) 경고가 4건인데 tail -7 이 요약 6줄에 밀려 마지막 1건만 보여줬다.
#   2) cd 상태 때문에 빌드가 실행조차 안 됐는데, grep 이 빈 출력에 아무것도
#      못 찾자 "경고 없음" 으로 읽었다.
# 둘 다 '조용한 성공'과 '조용한 실패'가 구분되지 않아서 생긴 일이다.
# 여기서는 빌드가 실제로 돌았는지 확인하고, 경고를 전부 보여준다.
set -e
cd "$(dirname "$0")/.."

out=$(python3 tools/build_cards.py 2>&1) || {
    echo "!! 빌드 실패"
    echo "$out"
    exit 1
}

echo "$out" | grep -E '^\[(warn|ERROR)\]' -A1 || true

n=$(echo "$out" | grep -c '^\[warn\]' || true)
e=$(echo "$out" | grep -c '^\[ERROR\]' || true)

# 빌드가 실제로 돌았다는 증거. 이 줄이 없으면 위 grep 의 침묵은 무의미하다.
echo "$out" | grep -q '^카드 ' || { echo "!! 빌드가 요약을 못 냈다 — 실행 자체를 의심할 것"; exit 1; }

echo
echo "$out" | grep -E '^(카드|  [a-z])'
echo
echo "경고 ${n}건 / 오류 ${e}건"
[ "$e" = "0" ]
