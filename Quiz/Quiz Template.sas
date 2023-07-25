option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data matrix;
infile '\\Client\D$\M338 SAS\Quiz\Q1data.txt' dlm=',';
input x1 x2;
label;
run;
/***************************************/
proc print label;
title 'Q6';
footnote 'End of Q6';
run;
