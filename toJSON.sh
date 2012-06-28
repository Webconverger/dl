#!/bin/bash
# With thanks to Daniel Mills, e36freak on #bash

echo '['

files=(./*.txt)
tot=${#files[@]}

for ((i=0; i<tot; i++)); do
  d=$(basename "${files[i]}" -count.txt)
  n=$(sort -u "${files[i]}" | wc -l)

  printf '{ "period" : "%s", "dl" : %s }' "$d" "$n"
  # print comma for all lines except last
  if ((i == tot - 1)); then
    echo
  else
    echo ,
  fi
done

echo ']'
