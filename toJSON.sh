#!/bin/bash

echo '['

for i in *.txt
do

	d=$(basename $i -count.txt)
	n=$(cat $i | sort | uniq | wc -l)

cat <<END
{ "period" : "$d", "dl" : $n },
END
done

echo '{}]' # <- suckless approach, add empty set
