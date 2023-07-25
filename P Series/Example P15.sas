/**************************************************
data temp;
input x y z;
datalines;
4 
7 17
12 23
14 92
;
run;
proc print;
run;
/**************************************************/
data temp;
*input test;
*datalines;
*5
7
;

length x $ 6.0;
call streaminit(0);
k = 40;
*n = 20;
*p = 0.3;
*alpha = 50;
*beta = 2.5;
do i = 1 to k;
	*xtab1 = rand('table',1/3,2/3);
	*xtab2 = rand('table', 1/6,1/6,1/6,1/6,1/6,1/6);
	xuni = rand('uniform',0,1); /*interval, 0<x<1*/
	if (0<= xuni <=0.5) then x = "male";
		else if (0.5< xuni <=1) then x = "female";
	*xnor = rand('normal',0,1);
	*xbin = rand('binomail',p,n);
	*xexp = rand('exponential');
	*xgam = beta* rand('gamma',alpha);
	output;
	*keep xuni x;
	*drop k i;
   *keep i xtab1 xtab2 xuni xnor xbin xexp xgam;
end; 

*datalines;
*5
7
;

*keep i xtab1 xtab2 xuni xnor xbin xexp xgam;
*keep xuni x;
*keep i x xnor xuni xbin xexp xgam;
run;
/*************************************************/
*proc print noobs data=temp(firstobs=20 obs=30);
proc print data=temp noobs;
var xuni x;
run;
/**************************************************
proc freq;
tables xtab1 xtab2 xbin;
*tables x xbin;
run;
/**************************************************
proc univariate;
var xnor xexp xgam;
histogram / normal;
run; 
/**************************************************
proc gchart;
*vbar xtab1 / discrete  space=0 type=pct width=10;
*vbar xtab2 / discrete  space=0 type=pct;
*vbar xuni / space = 0 type=pct;
*vbar xnor / space = 0 type=pct;
vbar xbin / discrete space=0 type=pct;
vbar xexp / space = 0 type=pct;
*vbar xgam / space = 0 type=pct;
run;
/*****************************************************
proc sgplot;
histogram xexp;
*density xexp;
*density xexp / type=kernel;
*density xnor;
run;
/****************************************************/
quit;
