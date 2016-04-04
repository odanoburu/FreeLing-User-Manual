
/<DecompositionRules>/ {
  inside=1; 
  delete field;
  delete vals;
  next;
}

/<\/DecompositionRules>/ {
  inside=0;
  next;
}

{
   if (inside) {
     print "\n### Part of Speech: `"$3"`"

     print "| Position | Atribute | Values |";
     print "|:----     |:----     |:----   |";

     print "| 0        | category | **"$1"**:_"$3"_ |";

     for (i=4; i<=NF; i++) {
        split($i,a,"/");
        printf "| %d | %s | ",i-3, a[1];
        n = split(a[2],b,";")
        for (j=1; j<n; j++) {
            split(b[j],c,":");
            printf "  **%s**:_%s_; ",c[1],c[2];
        }
        split(b[n],c,":");
        printf "  **%s**:_%s_",c[1],c[2];
        printf "|\n";
     }    
   }
}