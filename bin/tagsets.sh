#! /bin/bash

# generate Tagset documentation from tagset description files.
#
# usage:  
#  bin/tagsets.sh
#  git commit -a -m ""
#  git push

for x in ../freeling-git/data/??/tagset.dat ; do 
  lg=`basename $(dirname $x)`; 
  echo -e "## Tagset for ($x)\n" >tagset-$lg.md;  
  cat $x | gawk -f bin/tagset-rules.awk >> tagset-$lg.md; 

  echo -e "\n\n## Non-positional tags" >> tagset-$lg.md; 
  cat $x | gawk '/<DirectTranslations>/ {inside=1;next;} /<\/DirectTranslations>/ {inside=0;next} {if (inside) {print}}'  | sort -k3 | gawk -f bin/tagset-direct.awk >> tagset-$lg.md; 
done
