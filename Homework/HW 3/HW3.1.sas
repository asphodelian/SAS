/***** HW3 Q1** Gabrielle Salamanca *****/
options nodate;
/***Q3.A: Mean of M***
data uniform;
call streaminit(0);

a = 10000;

do i = 1 to a;
	sum = 0;
	M=0;
	do until (sum > 1);
 		x = rand('uniform', 0, 1);
		sum = sum + x;
 		M = M + 1;
		end;
		prob = M / a;
	output;
end;
run;
proc means data = uniform;
var M;
title 'Mean M: Gabrielle Salamanca';
run;
proc gplot;
plot prob*a;
title 'Plot of M: Gabrielle Salamanca';
run;
/***Q3.B: Mean of N***
data uni;
call streaminit(0);

b = 10000;

do i = 1 to (b+1);
	sum = 0;
	N = 0;
	do until (sum > 1);
 		x = rand('uniform', 0, 1);
		sum = sum + x;
 		N = N + 1;
		end;
		prob = N / (b+1);
	output;
end;
run;
proc means data = uni;
var N;
title 'Mean N: Gabrielle Salamanca';
run;
proc gplot;
plot prob*b;
title 'Plot of N: Gabrielle Salamanca';
run;
/***Q3.A, Ver2: Mean of M***/
data uniform;
call streaminit(0);

a = 10000;

do i = 1 to a;
	sum = 0;
	do until (sum > 1);
 		x = rand('uniform', 0, 1);
		sum = sum + x;
 		M = min(x);
		end;
		prob = M / a;
	output;
end;
run;
proc means data = uniform;
var M;
title 'Mean M: Gabrielle Salamanca';
run;
proc gplot;
plot prob*i;
title 'Plot of M: Gabrielle Salamanca';
run;
/***Q3.B Ver2: Mean of N***/
data uni;
call streaminit(0);

b = 10000;

do i = 1 to (b+1);
	sum = 0;
	N = 0;
	do until (sum > 1);
 		x = rand('uniform', 0, 1);
		sum = sum + x;
 		N = N + 1;
		end;
		prob = N / (b+1);
	output;
end;
run;
proc means data = uni;
var N;
title 'Mean N: Gabrielle Salamanca';
run;
proc gplot;
plot prob*i;
title 'Plot of N: Gabrielle Salamanca';
run;
/***********************************/
quit;
