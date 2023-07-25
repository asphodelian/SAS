/***HW 7***Gabrielle Salamanca***/
options nodate;
data hw7;
input coursename $1-4 section 5 ID 6-7 Name $9-16 
   / a b  c  d  e   f  / g  h  i  j  k  l ;
*input coursename $1-4 section 5@;
datalines;
M100101 Armann
10 10 10 10 8 9
13 15 10
M100102 Ellery
8 10 7 6 10 1
7 12 15
M100103 Anna
7 5 10 4 10 10
12 9 11
M100104 Tomo
9 8 10 5 10 5
10 14 12
M100301 Glenn
9 6 11 13
2 4 6 5 9 10 10 
M100302 Duc
14 12 10 12
9 10 10 8 10 10 10
M100303 Woo
14 15 12 9
8 7 9 10 5 9 10
M100304 Olson
10 10 12 11
5 10 7 9 8 10 10 
M100305 Ma
12 15 14 10
10 10 10 10 9 10 9
M100306 Garcia
14 13 15 11
9 10 8 10 10 6 10
;
run;
proc print noobs;
format ID z2.;
title 'SAD FACE :(';
run;

