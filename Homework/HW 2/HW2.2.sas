/***** HW2 Q1** Gabrielle Salamanca *****/
option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***********************************/
data Pareto;
call streaminit (0);

meanx = 0;
a = 5; /*shape parameter*/
p = 0;

do i = 1 to 961;
	sumx  = 0;
	do j = 1 to 625;
		xpar = rand('PARETO',a);
		x = 1.25+0.01*xpar; /*1.25 to 1.26*/
		sumx = sumx+x;
		end;
	meanx = sumx/625;
	if (1.25 <= meanx <= 1.26)then p = p + meanx;
		output;
	probx = p/961;
	output;
	end;
	
run;
/***********************************/
proc contents;
run;
/***********************************
proc print data = Pareto noobs;
run;
/***Q1.A: Simulated Probability***/
proc print data =  Pareto;
var prob;
title 'Question 1A: Gabrielle Salamanca';
run;
/***Q1.B: Mean of the Means***
proc print data =  Pareto;
title 'Question 1B: Gabrielle Salamanca';
run;
/***Q1.C: Standard Dev of Means***
proc print data =  Pareto;
title 'Question 1C: Gabrielle Salamanca';
run;
/***Q1.D: Histogram of Means***
proc univariate data =  Pareto;
var meanx;
histogram meanx / pareto;
title 'Question 1D: Gabrielle Salamanca';
run;
/***********************************/
quit;
