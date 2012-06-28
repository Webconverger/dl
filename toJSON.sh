#!/bin/bash

echo '['

for i in *.txt
do

	d=$(basename $i -count.txt)
	n=$(cat $i | sort | uniq | wc -l)

# TODO how do you remove last trailling comma so the JSON is 100%?
cat <<END
{ "period" : "$d", "dl" : $n },
END
done

echo ']'
