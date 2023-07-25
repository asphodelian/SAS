/******************Format Input*****************************
data temp1;
*input sex $ age;
input sex $ 1. age 3.;
datalines;
m100
f62 
f 25
m36 
f99 
m 37
f 88
m 25
m 63
f 23
m 34
f 92
m26 
f 23
m 45
m25 
f66 
m 26
;
run;
proc print;
run;
/************************************************************
data temp2;
input (sex age) ($1. 3.);
datalines;
m100
f62 
f 25
m36 
f99 
m 37
f 88
m 25
m 63
f 23
m 34
f 92
m26
f 23
m 45
m25 
f66 
m 26
;
proc print;
run;

/*******************************************************
data temp3;
input q1 2. g1 $1. q2 2. g2 $1. q3 2. g3 $1. q4 2. g4 $1. q5 2. g5 $1. 
q6 2. g6 $1. q7 2. g7 $1. q8 2. g8 $1. q9 2. g9 $1. q10 2. g10 $1. ;
datalines;
10A 9A8 B7 C 6D 5F10A 8B10A10A 
;
proc print;
title 'output 3';
run;
/******************************************************
data temp4;
input (q1-q10)(2. +1) @1 (g1-g10)(+2 $1.); 

*input (q1-q10)(2. +1) @3 (g1-g10)($1. +2);
*input (g1-g10)(+2 $1.) @1 (q1-q10)($2. +1);
datalines;
10A 9A8 B7 C 6D 5F10A 8B10A10A 
;
proc print;
title 'output 4';
run;
/*move from q1 to q10, move over 1, grab numeric value; move to col 1, move from g1 to g10, move over two, grab alphanumeric value*/
/*******************************************************
data temp5; 
*length name $50 ;
informat name $50. gender $1.;
input name $ gender $;
*input name : $500.  gender $1.;
*input name : $500. gender $1.;
*input name : $100. gender $;
datalines;
john m
barbara f
jill f
alexandria f
;
proc contents;
run;

proc print;
run;

/***************************************************
data temp6; 
input name : $15. gender $2.;
datalines;
john m
barbara f
jill f
alexandria f
;

proc contents;
run;
proc print;
run;
/****************************************************
data temp7;
input name $20.;
datalines;
john smith
barbara kafai
jill brown
rad aiyar
;

proc print;
run;

/************************************************/
data temp8;
*input name : $40. gender $1.;
input name : & $40. gender $1.;
datalines;
john smith  m
barbara kafai  f
jill brown  m
rad aiyar  m
;

proc print;
run;

quit;
