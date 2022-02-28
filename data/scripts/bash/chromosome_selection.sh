#!/bin/bash

#Script use to select the specific HPV type for mpileup

# Read the HPV type in the sample name
nofilter="$(echo $1 | grep -o -P 'HPV.{1,3}' | grep -o -E '[0-9]+')";
# Find the HPV type in the the list of HPV type created in the previous rule
nof2="$(grep -hnr "Human_papillomavirus_"$nofilter"_" $2)";
# Take all character after ">"


final="$(echo "$nof2" | awk -F'>' '{print $NF}')";

echo "Chromosome selected for $1:   $final"; 


# Do the chromosome/HPV type selection with samtools
samtools view $3 $final -b | samtools sort -o $4;
