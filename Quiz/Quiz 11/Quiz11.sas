option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********/
data Q11;
infile '\\Client\D$\M338 SAS\Data Files\q11data.txt';
input Y;
run;
/*********/
proc means;
var Y;
run;
/*********/
proc univariate alpha = 0.02 cibasic;
var Y;
title 'Q11';
footnote 'End of Q11';
run;
/*********
proc print noobs;
title 'Q11';
footnote 'End of Q11';
run;
