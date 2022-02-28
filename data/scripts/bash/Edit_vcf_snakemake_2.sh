#!/bin/bash

#read -p 'reference genome ' ref
#read -p 'bam file ' bamfile
#read -p 'output ' output

for x in $1

do

awk -v var=$2 'BEGIN{FS="\t";OFS="\t"} 
    {$15=var; print $0}' $1|awk 'BEGIN{FS="\t";OFS="\t"} 
    NR==1{$15="sample_id"}1'> $3

done
