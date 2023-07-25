*options nodate nonumber nocenter pagesize=47 linesize = 70 formdlim = '*';
*options pagesize=47 center formdlim = '*';
*options formdlim = '*';
libname datain '\\Client\D$\M338 SAS\Data Files';
/*****************************************************
data temp;
*data '\\Client\D$\M338 SAS\Data Files\NewState';
set datain.newstate;
*if visits > 1 then delete;
*if visits = 4 then output;
*if visits = 4;

*if uniform(0) < 0.33 then gender = 'Female';
*	else gender = 'Male';
*if 0 le visits lt 2 then v = 1;
*else if 2 le visits le 5 then v = 2;
run; 
/******************************************************
proc contents data=datain.newstate ;
title ;
run;
/******************************************************
proc print data=datain.newstate;
title ;
run;
/******************************************************
proc sort data=datain.newstate;
*by descending sale ;
*by region state;
*by region visits sale;
by region descending visits;
*by descending region;
*by descending state;
*by visits region;
run;
/******************************************************
proc print data=datain.newstate label noobs;
var region visits;
run;
/*****************************************************
proc print data=datain.newstate label;
id region; /*doesnt want to id by observation number but by region*
title 'ID statement';
var visits region sale;
run;
/***********************************************
proc sort data=datain.newstate;
by region;
run;
/***********************************************
proc print data=datain.newstate label;

by region;
title 'SUM statement';
var sale expenses;
sum sale expenses;
run;
/************************************************
proc sort data=datain.newstate;
by visits;
run;

proc print data=datain.newstate;
by visits;
run;
/***********************************************
proc sort data=datain.newstate;
by region;
run;

*proc print data=datain.newstate label noobs n;
proc print data=datain.newstate label noobs;
by region;
sumby region ;
*sum sale expenses;
title 'PAGEBY';
run;
/******************************************************
proc sort data=datain.newstate;
by visits;
run;

proc print data=datain.newstate label noobs;
by visits;
sum sale;
title 'BY and SUM statements';
run;
/***************************************************
proc sort;
by visits;
run;

proc print data=datain.newstate label noobs;
id visits;
by visits;
sum sale;
title 'ID, BY, and SUM statements';
run;
/***********************************************************/
proc sort data=datain.newstate;
by visits;
run;

proc print data=datain.newstate label noobs;
var sale;
*by visits;
*sum sale;
sumby visits;
title 'SUMBY statement';
run;
/********************************************************/

quit;
