/***HW3.2***Gabrielle Salamanca***/
options nodate;
/***HW3.2***Ver1***
data stick;

n = 10000;
ss = 0;
ls = 0;

do i = 1 to n;
	x = rand('uniform');
	short = min(x,1-x);
	long  = max(x,1-x);

	if short then ss = ss + short;
	if long = then ls = ls + long;

	meanx = ss/n;
	meany = ls/n

	EXY = ss/ls;
	EYX = ls/ss;

      output;
end;

run;
proc print data = stick;
var meanx meany EXY EYX;
run;
/***HW3.2***Ver2***
data stick;

long = 0;
short = 0;
n = 10000;

do i = 1 to n;
    x = rand('uniform',0,1);
    if x > 0.5 then long = long + x;
    else short = short + x;

    if x < 0.5 then short = short + x;
    else long = long + x;

    if x > 0.5 then h = x;
    if x < 0.5 then d = x;

    output;

	EYX = long/short;
	EXY = short/long;

end;

run;
proc print = stick;
run;
/***HW3.2***Ver3***/
data stick;
l=0;
s=0;
n=10000;
do i = 1 to n;
    x = rand('uniform',0,1);
    if x > 0.5 then l = l + x;
    else s = s + x;
    if x < 0.5 then s = s + x;
    else l = l + x;
    if x > 0.5 then h = x;
    if x < 0.5 then d = x;
    output;
	tlc = l/s;
	qlc = s/l;

end;

run;
/*******************************
proc means data = stick;
var h d tlc qlc;
run;
/*******************************
proc print;
var h d tlc qlc;
run;
/*******************************/
proc sgplot;
series x = i y = tlc;
series x = i y = qlc;
run;
/***HW3.2***Ver4***
data ver4
do i= 1 to 100;
      r= rand('uniform');
      Short = min(r,1-r);
      long  = max(r,1-r);
      output;
   end;
run;
proc means data = ver4;
var long short;
run;
/*******************************/
quit;
