data temp;
*infile datalines;
*infile datalines flowover;
infile datalines missover;
*infile datalines stopover ;
input x1-x5;
datalines;
2 4 7 12 18
13 12 19 22 34
44    2     18
5 15 24 39 44
3 234 34 545 45
65 7 77 45 45 
456 34 456 23 76 
45 45 67 89 8
6 3
7 8 9 9 4
;
proc print;
run;

