option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data datain.q3black datain.q3hispanic;
set datain.q3data;
if RIDRETH1 = 4 then output datain.q3black;
if RIDRETH1 = 1 then output datain.q3hispanic;
run;
/***************************************
proc print data = datain.q3black;
title 'Black Race/Ethnicity';
var seqn riagendr ridageex;
run;
/***************************************/
proc print data = datain.q3hispanic;
title 'Hispanic Race/Ethnicity';
var seqn riagendr ridageex;
run;
/***************************************/
quit;
