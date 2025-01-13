#! /usr/bin/env bash

INPUT="$1"
OUTPUT="${INPUT}.${RANDOM}"

cat "${INPUT}" | jq '{
  cells: .cells | map(
    if (.cell_type == "code") then . + { source: [] } else .
    end
  )
}' > "${OUTPUT}"

mv "${OUTPUT}" "${INPUT}"
