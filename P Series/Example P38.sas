libname sasout '\\Client\D$\M338 SAS\Data Files';
/*********/
data sasout.workers;
infile '\\Client\D$\M338 SAS\Data Files\workers.txt';
input age ed sex income;
run;
/*********
proc contents;
run;
/*********
proc print;
run;
/*********/
proc univariate;
var income;
run;
/*********
proc freq;
tables age ed sex sex*ed;
run;
/*********
*ods select  TestsForLocation BasicIntervals  ;
proc univariate alpha=0.01 cibasic mu0=45000;
var income;
histogram income / normal;
run;
/*********
proc sort;
by ed;
run;
/*********
*ods select  TestsForLocation BasicIntervals;
*ods select BasicIntervals;
proc univariate cibasic mu0=45000;
class ed;
var income;
histogram income / normal;
run;
/*********
proc means;
class ed;
var income;
*by ed;
run;
/*********/
quit;
