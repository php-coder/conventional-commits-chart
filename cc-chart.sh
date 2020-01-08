#!/bin/sh

set -eu

fatal() {
	echo "$@"
	exit 1
}

if [ $# -ne 2 ]; then
	fatal "Usage:\n\t$0 <FROM_REVISION> <TO_REVISION>\nExample:\n\t$0 0.1 HEAD"
fi

RANGE="${1}..${2}"

DATA="$(git log --format=%s ${RANGE} | sed -E 's/^([^:( ]+).*/\1/' | awk '{if(!/^(refactor|test|fix|perf|revert|chore|feat|style|build|ci|docs)$/){$0="unknown"};print}' | sort | uniq -c)"
[ -n "$DATA" ] || fatal "ERROR: couldn't parse git log"

TYPES="$(  echo "$DATA" | awk "{printf(\"'%s (%s)'\n\",\$2,\$1)}" | paste -d, -s -)"
COMMITS="$(echo "$DATA" | awk '{print $1}' | paste -d, -s -)"

printf "https://quickchart.io/chart?c={type:'bar',data:{labels:[%s],datasets:[{label:'Number of commits: %s',data:[%s]}]}}\n" "$TYPES" "$RANGE" "$COMMITS"
