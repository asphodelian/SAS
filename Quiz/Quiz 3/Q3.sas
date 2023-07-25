option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data q3black;
set datain.q3data;
if RIDRETH1 = 4 then output;
run;
/***************************************/
data q3hispanic;
set datain.q3data (drop = RIDRETH1);;
if RIDRETH1 = 1 then output;
run;
/***************************************/
proc print data = q3black;
var seqn riagendr;
run;
/***************************************/
proc print data = q3hispanic;
var seqn riagendr;
label seqn = 
run;
/***************************************/
proc print label;
title 'Q3';
footnote 'End of Q3';
run;
/***************************************/
quit;
