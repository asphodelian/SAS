libname thornton 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data';
/***************************************************************/
proc import datafile = "C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\grades.xlsx"
			dbms = xlsx
			out = og replace;
getnames = yes;
run;
/****************************************************************/
proc print data=og ;
run;
/***************************************************************
data temp;
set thornton.outg;
run;
/****************************************************************/
proc contents data=og;
run;
/****************************************************************
proc print data=og;
run;
/****************************************************************/
proc print data=og;
var q13 name q12 q15;
run;
/****************************************************************/
proc print data = og(obs=10);
var q13 name q12 q15;
run;
/****************************************************************/

quit;
