/***** Q1C ** Gabrielle Salamanca *****/
option nodate pagesize=50;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*************************************/
data regions;
set datain.hw1;
run;
/*************************************/
proc sort data = regions;
by region descending expenses;
run;
/***************************************************/
proc print data = regions label noobs;
by region;
var state salesman expenses;
sum expenses;
title 'Question 1C.i: Gabrielle Salamanca';
run;
/***************************************************
data visiting;
set datain.hw1;
run;
/***************************************************
proc sort data = visiting;
by visits;
run;
/***************************************************
proc print data = visiting label noobs;
by visits;
var state;
title 'Question 1C.ii: Gabrielle Salamanca';
run;
/***************************************************/
quit;
