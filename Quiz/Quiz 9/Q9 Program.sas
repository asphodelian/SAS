data q9;
n = _n_;
do x = 1 to 5;
input y @;
output;
end;
datalines;
5 9 22 26
7 12 93 42 69
;
run;
proc print;
run;
