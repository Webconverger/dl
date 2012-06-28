#!/bin/bash
# https://developers.google.com/chart/interactive/docs/gallery/annotatedtimeline
# JSON syntax https://developers.google.com/chart/interactive/docs/reference#dataparam
# TIP: DataTable.toJSON() to understand syntax better

cat <<HEAD
{ "cols" :
[
{ "id" : "date", "label" : "Date", "type" : "date" },
{ "id" : "dl", "label" : "Downloads", "type" : "number" }
],
"rows" :
[
HEAD

# Order shouldn't matter
for i in *.txt
do

	d=$(basename $i -count.txt | tr - ' ')
	set -- $d # Old school parsing
	d=$1,$(( $2 - 1)),$3
	n=$(cat $i | sort | uniq | wc -l)

cat <<END
{ "c" : [ { "v" : "Date($d)" }, { "v" : $n } ] },
END
done

cat <<FOOT
]
}
FOOT

