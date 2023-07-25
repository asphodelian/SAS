options nonumber nodate ;
/****************************************
data temp1;
input x y; 
datalines;
3 .
. 4
. 2
2 6
;
/***************************************
proc print;
*var x;
run;
/***************************************
proc means;
var x y;
run;
/****************************************
data temp2;
set temp1;
array z[2] x y;
do i= 1 to 2;
	if z[i]=. then z[i] = 0;
end;

*drop i;

proc print=temp2;
*var x;
run;
/****************************************
proc means;
var x y;
run;
proc contents;
run;

/***************************************
data temp3;
set temp1;
array z[*] x y;
do i= 1 to dim(z);
	if z[i]=. then z[i] = 0;
end; 

*drop i ;

proc print;
run;

/****************************************
data temp3;
input x $ y $;
array carr(2) x y ;
do i = 1 to 2;
	if carr(i) = '-3' then carr(i) = 0;
		else carr(i) = '1';
end;
drop i;
datalines;
-3 4
2 -5
5 7
10 9
-3 -1
7 7
6 -2
;

proc print;
run;
/********************************************/
PROC IMPORT 
OUT = temp1
DATAFILE= '\\Client\D$\M338 SAS\Data Files\Tierney.xlsx'
DBMS=xlsx REPLACE;
GETNAMES=YES;
*label ascode = 'Area Start Code';
RUN;
/*********************************************
proc contents;
run;
/*********************************************/
proc print label noobs;
var ascode wp1-wp17;
run;
/*********************************************/
data temp;
set temp1 (keep=wp1-wp17 ascode);
array xx[*] wp1-wp17;
do i = 1 to dim(xx);
	if xx[i]=. then xx[i] = 0;
end;
drop i ;
proc print noobs;
run;
