/***** Q1B ** Gabrielle Salamanca *****/
option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*************************************/
data northeast;
set datain.hw1;
if region = 'Northeast' then output;
run;
/*************************************
proc sort data = northeast;
by region;
run;
/***************************************************/
proc print data = northeast;
title 'Question 1B.i: Gabrielle Salamanca';
run;
/***************************************************
data regional;
set datain.hw1;
if visits = 5 then delete;
run;
/***************************************************
proc print data = regional;
title 'Question 1B.ii: Gabrielle Salamanca';
run;
/***************************************************/
data southeast;
set datain.hw1;
*if first(left(region))='S' then output;
if region = 'Southeast' then output;
run;
/*************************************/
proc sort data = southeast;
by region;
run;
/***************************************************/
proc print data = southeast label noobs;
*proc print data = southeast (firstobs = 1 obs = 10) label noobs;
var region state;
title 'Question 1B.iv: Gabrielle Salamanca';
run;
/*************************************
data states;
set datain.hw1;
if first(left(state))='M' then delete;
if first(left(state))='N' then delete;
if first(left(state))='T' then delete;
run;
/***************************************************
proc print data = states;
var state;
title 'Question 1B.v: Gabrielle Salamanca';
run;
/***************************************************/

quit;
