data matrix;
infile '\\Client\D$\M338 SAS\Quiz\Q1data.txt' dlm=',';
datalines ;
input x1 x2;
label;
run;
/***************************************/
proc print label;
title 'Q1';
footnote 'End of Q1';
run;
