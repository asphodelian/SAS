libname thornton '\\Client\D$\M338 SAS';
/***************************************/
data matrix;
infile '\\Client\D$\M338 SAS\Data Files\data2.txt' ;
input h w gender bmi;
label h = 'Height in inches';
label w = 'Weight in pounds';
label gender = '1=M' '2=F';
label bmi = 'Body Mass Index';
run;
/***************************************/
proc print label data = matrix;
run;
/***************************************
proc print data = matrix;
run;
/***************************************/
title 'Q2_2.sas';
footnote 'End of Q2_2';
run;
