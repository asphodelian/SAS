option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data Q12;
infile '\\Client\D$\M338 SAS\Data Files\q12data.txt';
input Y;
*if Y = 1 then Y = 'received a flue shot';
	*else Y ='did not receive flu shot';
run;
/***************************************/
proc univariate alpha = 0.02  mu0 = 0.15 cibasic;
var Y;
run;
proc ttest;
var Y;
title 'Q12';
footnote 'End of Q12';
run;
/***************************************/
quit;
