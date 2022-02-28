#!/bin/bash

#read -p 'reference genome ' ref
#read -p 'bam file ' bamfile
#read -p 'output ' output


samtools mpileup -B -d 10 -A -a -f $1 $2 | cut -d$'\t' -f4- --complement > $3 

awk -F'\t' 'NR==FNR{A[$2]=$0; next} {A[$2]; B[$2]=$0} END{for (id in A) print A[id],B[id]}' OFS='\t' $3 $4 |

#cut -d$'\t' -f4- --complement "totalgenome"_$3 > "Total_names"_$3

#awk -F'\t' 'NR==FNR{A[$2]=$0; next} {A[$2]; B[$2]=$0} END{for (id in A) print A[id],B[id]}' OFS='\t' "Total_names"_$3 $4
awk '$4=$1' FS='\t'  OFS='\t' | 
awk '$5=$2' FS='\t'  OFS='\t' | 
awk '$6=$3' FS='\t'  OFS='\t'|
cut -d$'\t' -f -3 --complement | awk -F'[[:space:]]' '$3 && !$4{ $4="0"; $5="0"; $6="0"; $7="0"; $8="0"; $9="0"; $10="0"; $11="0"; $12="0"; $13="0"; $14="0"}1'  FS='\t'  OFS='\t' |
awk -vOFS="\t" '$1=$1; BEGIN { str="chr	position	reference	coverage	A	G	C	T	deletion	skip	qA	qG	qC	qT"; split(str,arr," "); for(i in arr) printf("%s\t", arr[i]);print}' > $5

## indel are not correctly merged and coverage disapear in idel positive regions.