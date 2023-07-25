libname form '\\Client\D$\M338 SAS\Library';
options FMTSEARCH=(form);
/******************************************************************/
data temp1;
input grade;
datalines;
25 
66
54
92
80
;

proc print;
format grade letter.;
run;
proc print;
format grade numb.;
run;
/**************************************************/
data temp2;
input weight;
datalines;
35
66
194
82
255
320
145
;
proc print;
format weight weightf.;
run;

proc print;
format weight weightp.;
run;

/*************************************************/
data temp3;
input ssn pssn 5-8;
datalines;
560367989
566285679
;
proc print;
format ssn ssnu. pssn padd.;
run;
/*************************************************/
data temp4;
input x;
datalines;
.23
0.4
.79
;
proc print;
format x perc.;
run;
