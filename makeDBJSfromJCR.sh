#!/bin/bash

mv db.js db.js.old
cat JCR_data/JCR2024_parsed.txt | tail -n +2 | grep -vw NA | awk -v q="'" 'BEGIN{FS="\t"; OFS=""; ORS=""; print "var dataSource = {"}; {print q,$1,q": [",$2,", ",$3,", ",q,$4,q,"], "}; END{print "};"}' > db.js
