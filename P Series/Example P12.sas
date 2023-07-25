*options nodate pageno=1 nocenter  linesize = 100;
*goptions device=gif
	hsize=4in vsize=3in
	border
	ftext=?Helvetica? htext=12pt
	hpos=40;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********************************************.
proc print label data = datain.newstate;
run;
/***************************************************
proc sort data = datain.newstate;
by region;
run;
/***************************************************
proc means data = datain.newstate;
var sale;
by region;
run;
/***************************************************
*proc means data = datain.newstate alpha = 0.01 mean clm maxdec=2;
proc means data = datain.newstate p50 clm maxdec=2;
*proc means data = datain.newstate mean clm maxdec=1 alpha = 0.01;
by region;
var sale;
run;
/*****************************************************
proc means data = datain.newstate n mean maxdec=1;
class region;
*class visits;
var sale ;
run;
/*****************************************************
proc gplot data = datain.newstate;
plot sale*expenses = region;
*plot sale*visits=gender;
*plot sale*visits = salesman;
run;
/**************************************************
proc gplot data = datain.newstate;
*bubble sale*expenses = region;
bubble sale*visits=salesman ;
run;
/*****************************************************/
*ods graphics off;
*ods select plots ssplots;
proc univariate data = datain.newstate;
*proc univariate data = datain.newstate cibasic;
var sale;
histogram sale /normal;
histogram sale / gamma;
run;
/**************************************************
proc sgplot data = datain.newstate;
  vbox sale / category = region;
run;
/***********************************************/
quit;
