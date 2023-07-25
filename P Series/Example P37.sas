data atten;
infile '\\Client\D$\M338 SAS\Data Files\attentimes.txt';
input at;
label at = 'Attention Times';
run;
/*********
proc print label;
run;
/*********
*proc means data = atten;
proc means data = atten n mean stderr median p50 clm maxdec=2;
*proc means data = atten n mean stderr median p50 alpha=0.02 clm maxdec=2;
var at;
run;
/*********
*proc univariate data = atten;
*proc univariate data=atten mu0=20
proc univariate data = atten mu0=20 cibasic;
var at;
histogram at / normal;
run;
/*********/
ods select TestsForLocation BasicIntervals;
proc univariate data = atten cibasic mu0=20;
var at;
histogram at / normal;
run;
/*********/
quit;
