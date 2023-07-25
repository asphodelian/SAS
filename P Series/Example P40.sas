libname sasin '\\Client\D$\M338 SAS\Data Files';
proc format;
value gend	2 = 'Female'
			1 = 'Male';
value succ	4,5,6 = '1-Success'
			1,2,3 = '2-Failure';
value succN	4,5,6 = '2-Success'
			1,2,3 = '1-Failure';
			
run;
/****************************************************/
data worker;
set sasin.workers;
*format sex gend. ed succ.;
run;
/*****************************************/
proc print ;
run;
/******************************
proc univariate;
var income;
histogram income / normal;
run;
proc freq;
tables age sex ed ;
run;
/**********************************************
proc sort;
by sex;
run;
/********************************************
proc gchart;
vbar3d income / space=0 group=sex;
*vbar income /space=0;
*by sex;
run;
/***********************************************
proc univariate;
var income;
by sex;
*histogram income / normal;
run;
/**********************************************
proc ttest;
class sex;
var income;
format sex gend.;
run;
/**********************************************
proc ttest order=formatted;
*proc ttest;
class ed;
var income;
*format ed succ.;
format ed succN.;
run;
/******************************************************************/

quit;
