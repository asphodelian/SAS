data Q4;
input x;
k= _n_;
do j = 1 to 2;
	y = j**2-2;
	output;
end;
datalines;
7
26
;
proc print data = Q4;
run;
