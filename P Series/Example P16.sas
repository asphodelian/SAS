*options nodate nonumber  LINESIZE=70;
/**************************************************
data temp0;
input y;
do j = 1 to 10;
    x = j + 3 ;
	k = _N_  + j; 
	output;
end;
datalines;
23
13
;
run;
/*_N_ internal var, can't print it*/
/*10 outputs times # of datalines*/
/**************************************************
proc contents;
run;
proc print;
title 'temp0';
run;
/************************************************
data temp1;
i = _n_ ;
do j = 1 to 10;
    x = j + 3 ;
	k = _N_  + j;
	output;
	*if (j < 5) then output ;
end;
run;
proc print noobs;
title 'temp1';
run;
/**************************************************
data temp2;
call streaminit(0);
do i = 1 to 6000000;	
   x = rand('uniform',0,1);;
   if x < (1/6) then roll = 1 ;
   		else  if ((1/6) <x< (2/6)) then roll = 2;
		else  if ((2/6) <x< (3/6)) then roll = 3;
		else  if ((3/6) <x< (4/6)) then roll = 4;
		else  if ((4/6) <x< (5/6)) then roll = 5;
		else roll = 6;
	output;
end;
run;
/****************
proc freq;
tables roll;
run;
/**************************************************
data temp3;
call streaminit(0);
*length toss $4.0;
*headnum = 0;
*do n = 100 to 100000 by 100;
do n = 1000, 2000, 10000 to 300000 by 1000;
*do n = 10, 20;
headnum = 0;
*do n = 10, 100, 1000, 2000, 10000, 15000;
*n = 1000;
*n = 1000000;

	do i = 1 to n ;
   		x = rand('uniform',0,1);
   		if x > 0.5 then do;
                     toss = 'head';
                     headnum = headnum + 1;
                   end ;
 	else toss = 'tail';
    *prob = headnum / n ;
  *output;
end;
prob = headnum / n ;
output;
*drop seed i x headnum toss;
*keep n headnum  prob toss;
keep n prob headnum;
end;
run;
/***************************************
proc print ;
title 'temp3';
run;
/********************************
proc freq;
tables toss;
run;
/*********************************************
symbol1 color = purple
		interpol = join
		value = dot;
/**********************************************
proc gplot ;
*plot prob*n;
plot prob*n / vaxis = 0.4 to 0.6 by 0.01;
run;
/**********************************************
ods graphics on / width=16in height=10in;
proc sgplot;
series  x = n y = prob / lineattrs=(color=blue);
refline 0.5 / axis= y lineattrs=(color=red);
run;
ods graphics off;
/*********************************************
data temp5;
j = 1 ;
do while (j <= 13);
 j = j + 1;
 output;
end;
run;
proc print;
title 'WHILE LOOP';
run;
/**********************************************
data temp4;
k = 1 ;
do until (k >= 1);
 k = k + 1;
 output;
end;
run;
proc print;
title 'UNTIL LOOP';
run;
/**********************************************
data temp6;
call streaminit(0);
x = rand('uniform',0,1);
output;
do i = 1 to 100 while (x < 0.8);
	output;
	x = rand('uniform',0,1);
output;
end;
run;
proc print;
title 'temp6';
run;
/***********************************************
data temp7 ;
call streaminit(0);
x = rand('uniform',0,1);
do i = 1 to 100 until (x >= 0.8);
	output;
	x = rand('uniform',0,1);
*output;
end;
run;

proc print;
title 'temp7';
run;
/*************************************************
data temp7;
y = ranuni(33);
do j = 1 to 100 until (y < 0.80);
output;
	y = uniform(j);
end;
proc print;
title 'temp7';
run;
/************************************************
data temp6;
x = ranuni(33);
do i = 1 to 100 while (x >= 0.8);

	x = ranuni(i);
	output;
end;
proc print;
title 'temp6';
run;
/***************************************************
data temp61;
do i = 1 to 100 while (ranuni(33) < 0.8);
	output;
end;

proc print;
title 'temp61 - while loop';
run;
/***************************************************
data temp71;
do j = 1 to 100 until (uniform(33) > 0.80);
	output;
end;
proc print;
title 'temp71 - until loop';
run;
/*************************************************/
data temp8;
do x = 1 to 100 by 1;
*do x = 0.5 to 0.01 by -0.001;
*do x = -0.5 to -0.01 by 0.001;
*do x = -.5 to -0.01 by 0.001, .5 to 0.01 by -0.001;
*do x = 1 to 100;
*	x0 = 1/x ;
*	a = 1 / x ;
	*y1 = (1/x)**(1/x);   
	*y2 = (1+1/x)**x; 
	*y3 = sin(x) / x ;  
	*y4 = x / sin(x) ; 
	y5 = (-1)**x;
	output;
end;
run;
/**************************************************/
proc print;
run;
/*****************************************************
proc print;
*var y1 y2 y3 y4;
*format y1 10.4 y2 10.4 y3 10.4 y4 10.0;
run;

/******************************************************
symbol1 color = red
		interpol = join
		value = dot;
/******************************************************/
proc gplot;
*plot y1*x;
*plot y2*x;
*plot y3*x;
*plot y4*x;
plot y5*x;
*plot (y1 y2 y3 y4)*x;
*plot y3*X / vaxis = -0.01 to 0.01 by 0.001;
run;
/*********************************************************/
quit;
