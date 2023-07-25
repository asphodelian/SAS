options nodate pageno = 1 pagesize = 50 center linesize = 90;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*****************************************************/
data datain.newstate;
*set '\\Client\D$\M338 SAS\Data Files\statedat';
set datain.statedat;

sale = sale * 10000;
expenses = expenses * 1000;

*if visits > 1 then delete;

run;
/*******************************************************
proc contents;
run;
/*******************************************************
proc print data=datain.statedat;
run;
/*******************************************************/
proc print data=datain.newstate;
run;
/********************************************************/
proc options;
run;
/********************************************************/
quit;





