#!/bin/bash

#read -p 'reference genome ' ref
#read -p 'bam file ' bamfile
#read -p 'output ' output

for x in $1

do


cut -d, -f3,8,10-22,24,26-38,43-48 --complement $x |awk 'BEGIN{FS=",";OFS=","}
    {
      for(i=1;i<=(NF-1);i++)
      {
        if($i == ""){
         $i="X"
        }
      }
      print
    }' | sed "s/<[*]>/X/g" | sed "s/-1/X/g" |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($3 == "A"){
         $14=$10 ; $18=($8/($10+0.000000000001))
        } else {$14="0" ; $18="0"}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($3 == "T"){
         $17=$10 ; $21=($8/($10+0.000000000001))
        } else {$17="0" ; $21="0"}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($3 == "G"){
         $15=$10 ; $19=($8/($10+0.000000000001))
        } else {$15="0" ; $19="0"}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($3 == "C"){
         $16=$10 ; $20=($8/($10+0.000000000001))
        } else {$16="0" ; $20="0"}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($4 == "A"){
         $14=$11 ; $18=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($4 == "T"){
         $17=$11 ; $21=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($4 == "G"){
         $15=$11 ; $19=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($4 == "C"){
         $16=$11 ; $20=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($5 == "A"){
         $14=$12 ; $18=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($5 == "T"){
         $17=$12 ; $21=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($5 == "G"){
         $15=$12 ; $19=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($5 == "C"){
         $16=$12 ; $20=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($6 == "A"){
         $14=$13 ; $18=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($6 == "T"){
         $17=$13 ; $21=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($6 == "G"){
         $15=$13 ; $19=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }' |awk 'BEGIN{FS=",";OFS=","}
    {
      {
        if($6 == "C"){
         $16=$13 ; $20=($9/($11+$12+$13+0.000000000001))}
      }
      print
    }'|awk 'BEGIN{FS=",";OFS=","} 
    {print $0, $10+$11+$12+$13}'|awk 'BEGIN{FS=",";OFS=","} NR==1{$14="A"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$17="T"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$15="G"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$16="C"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$18="qA"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$19="qG"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$20="qC"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$21="qT"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$1="chr"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$2="position"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$3="reference"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$22="coverage"}1'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$7="deletion"}1'|awk 'BEGIN{FS=",";OFS=","} 
    {$23=0; print $0}'|awk 'BEGIN{FS=",";OFS=","} 
    NR==1{$23="skip"}1'|awk 'BEGIN{FS=",";OFS=","} {print $1"\t"$2"\t"$3"\t"$22"\t"$14"\t"$15"\t"$16"\t"$17"\t"$7"\t"$23"\t"$18"\t"$19"\t"$20"\t"$21"\t"$24}' > $2

done
