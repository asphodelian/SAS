/***** HW2 Q1** Gabrielle Salamanca *****/
option nodate;
/***********************************/
data Beta;

call streaminit (0);

meanx = 0;

do i = 1 to 961;							 	
	sumx  = 0;
	summean = 0;
	do j = 1 to 625;							
		xbeta = rand('BETA',0.5,0.5);			
		x = 0.49+0.2*xbeta; 					
		sumx = sumx+x;
		end;
	meanx = sumx/625;
	summean = summean + meanx;
	output;
	end;

run;
/***********************************
data Beta2;

call streaminit (0);

meanx = 0;

do i = 1 to 961;							 	
	do j = 1 to 625;							
		xbeta = rand('BETA',0.5,0.5);			
		end;
	output;
end;

run;
/***********************************
proc means data = Beta2;
by i;
var x;
output out=OutStats3 mean=SampleMean std=SampleStd;
run;
/***********************************
proc contents;
run;
/***********************************
proc print data = Beta;
var y;
run;
/***********************************
proc print data = Beta noobs;
run;
/***Q1.A: Simulated Probability***
proc print data = Beta;
title 'Question 1A: Gabrielle Salamanca';
run;
/***Q1.B: Mean of the Means***/
proc means data = Beta noprint;

title 'Question 1B: Gabrielle Salamanca';
run;
/***Q1.C: Standard Dev of Means***
proc print data = Beta;
title 'Question 1C: Gabrielle Salamanca';
run;
/***Q1.D: Histogram of Means***
proc univariate data = Beta;
var meanx;
histogram meanx / beta;
title 'Question 1D: Gabrielle Salamanca';
run;
/***********************************/
quit;
