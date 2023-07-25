*options nonumber nodate;
/**************************Free Format************************
data temp0;
k = _n_;
input sex $ age;
datalines;
m 100
f 62 
f 26
m 36 
f 99
m 37 
f 88 
m 25 
m 63 
f 23 
m 34 
f 103 
m 26
f 23 
m 45 
m 25 
f 66 
m 26
;

proc print;
title 'List Input';
run;

/*************List Input, @@ w/ streaming******************
data temp1;
k = _n_ ;
input sex $ age @@;
datalines;
m 100 f 62 f 25 m 36 f 99 m 37 f 88 m 25 m 63 f 23 m 34 f 103 m 26 f 23 m 45 m 25 f 66 m 
26
;
/*****Above is called streaming******
proc print;
title 'List Input with @@';
run;
/*******************************************************
data temp2;
input fname $ lname $ ssn race $ class $ / weight height / TCP bloodt $ ;
*input fname $ lname $ ssn race $ class $ // TCP bloodt $;
k = _n_;
datalines;
John Smith 999698888 W J
129 66
198 O
Jack Brown 888599999 B S
145 64
190 A 
;

proc print;
title 'Input with /';
format ssn ssn.;
run;
/*************************************************************
data temp3;

input // TCP bloodt $;
*input fname $ lname $ ssn race $ class $ // ;
*input fname $ lname $ ssn race $ class $ // TCP bloodt $;
*input fname $ lname $ ssn race $ class $ //;
*input fname $ lname $ ssn race $ class $ / weight height / TCP bloodt $;

k = _n_;

datalines;
John Smith 999698888 W F
129 66
198 O
Jack Brown 888599999 B S
145 64
190 A
;
proc print;
title 'Input with //';
run;
/****************************************************************
data temp4;
k = _n_;
input fname $ lname $ ssn race $ class $ #3 TCP bloodt $ #2 weight height;
datalines;
John Smith 999698888 W F
129 66
198 O
Jack Brown 888599999 B S
145 64
190 A
;
proc print;
title 'Input with #';
run;
/*************************************************************
data temp5;
input fname $ lname $ ssn race $ class $ #3 ;
datalines;
John Smith 999698888 W F
129 66
198 O
Jack Brown 888599999 B S
145 64
190 A
;
proc print;
format ssn ssn.;
title 'Input with #';
run;
/*************************************************************
data temp7;
input fname $ lname $ ssn race $ class $ #6 TCP bloodt $ #2 weight height ;
datalines;
John Smith 999698888 W F
129 66
198 O
Jack Brown 888599999 B S
145 64
190 A
John Smite 999628888 W F
135 72
203 B
Jack Brite 888599999 B S
149 52
196 AB
;
proc print;
title 'temp7';
run;
/*************************************************************
data temp6;
infile datalines n=8;
input fname $ lname $ ssn race $ class $  ///// TCP bloodt $ #2 
weight height;

datalines;
John Smith 999698888 W F
129 66
198 O
Jack Brown 888599999 B S
145 64
190 A
;
proc print;
title 'Input with / and #';
run;
/*************************************************************/
data tempetc;
infile datalines n=7; 
input seqn local  ////// age iq #2 weight height;
datalines;
1 2
150 50
555 666
7 8
99 1010
111111 121212
13 14
1515 1626
160 60
19 20
2121 2222
232323 242424
25 26
27 28
292929 303030
200 20
3333 3434
353535 363636
37 38
3939 4040
41 42
;
run;
proc print;
title 'Input with / and #';
run;
/*******************************************************/
quit;
