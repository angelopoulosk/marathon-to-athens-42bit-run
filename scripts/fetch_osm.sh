#!/usr/bin/env bash
# Downloads OpenStreetMap buildings, parks and the stadium for the last 2 km
# of the course (Vas. Sofias -> Irodou Attikou -> Panathenaic Stadium).
# Output: data/osm-last-2km.json  (c) OpenStreetMap contributors, ODbL
set -euo pipefail
cd "$(dirname "$0")/.."
BBOX="37.9659,23.7381,37.9792,23.7533"
Q="[out:json][timeout:90];(way[\"building\"]($BBOX);relation[\"building\"]($BBOX);way[\"leisure\"~\"park|garden|stadium\"]($BBOX);relation[\"leisure\"~\"park|garden|stadium\"]($BBOX););out tags geom;"
OUT=data/osm-last-2km.json
for HOST in https://overpass-api.de https://overpass.kumi.systems https://overpass.private.coffee; do
  for TRY in 1 2; do
    if curl -fsS -m 120 -A "marathon-to-athens-42bit-run" --data-urlencode "data=$Q" "$HOST/api/interpreter" -o "$OUT.tmp" \
       && grep -q '"elements"' "$OUT.tmp"; then
      mv "$OUT.tmp" "$OUT"
      echo "Saved $OUT ($(wc -c < "$OUT") bytes) from $HOST"
      exit 0
    fi
    sleep 10
  done
done
rm -f "$OUT.tmp"
echo "All Overpass servers failed" >&2
exit 1
