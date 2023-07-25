/***** HW2 Q2** Gabrielle Salamanca *****/
option nodate;
/***********************************/
data temp;
call streaminit(1);
do j = 1 to 961;
 sumx = 0;
 meanx = 0;
 	do i = 1 to 625;
 		x = rand('Pareto', 5);
 		sumx = sumx + x;
 		meanx = sumx/625;
	end;
	output;
end;
run;
/***********************************
proc contents;
run;
/***Q2.A: Simulated Probability***/
data temp1;
set temp;
prob = (1.25 <= meanx <= 1.26);
run;
proc freq data = temp1;
tables prob;
title 'Question 2A: Gabrielle Salamanca';
run;
/***Q1.B: Mean of the Means & Q1.C: Standard Dev of Means***/
proc means data = temp mean std;
var meanx;
title 'Question 2B & 2C: Gabrielle Salamanca';
run;
/***Q1.D: Histogram of Means***/
proc sgplot data = temp;
histogram meanx;
title 'Question 2D: Gabrielle Salamanca';
run;
/***********************************/
quit;
