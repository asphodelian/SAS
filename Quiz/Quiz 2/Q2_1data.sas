libname thornton '\\Client\D$\M338 SAS';
/***************************************/
data matrix;
infile '\\Client\D$\M338 SAS\Data Files\data2.txt' ;
input h w gender bmi;
run;
/***************************************/
proc print data = matrix;
run;
title 'Q2_1.sas';
footnote 'End of Q2_1';
run;
