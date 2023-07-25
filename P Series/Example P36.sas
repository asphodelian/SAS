options nonumber nodate ;
/*************************************************/
PROC IMPORT OUT = temp1
DATAFILE= "\\Client\D$\M338 SAS\Data Files\array.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
RUN;
/*************************************************
proc contents;
title 'temp1';
run;
/*************************************************/
proc print;
title 'temp1 print';
run;
/*************************************************/
data temp2;
set temp1 (keep= first--f);
file '\\Client\D$\M338 SAS\Data Files\April30-1.txt';
put  first--f;
run;
/************************************************
proc contents;
title 'temp2';
run;
/*************************************************
data temp3;
infile 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\data\April30-2.txt';
input first $ q1-q15 p1-p3 m f;
run;
/************************************************
proc contents;
run;
/************************************************
proc print;
run;
/***********************************************
data temp4;
set temp1;
array score[*] q1-q15;
do i = 1 to dim(score);
   if score[i] = . then score[i] = 0;
end;
proc contents;
run;
proc print;
run;
/*************************************************
data temp5;
file print;
length answer $5;
input answer ;
correct = 'ABCDE';
vervalue = verify (answer,correct);
if verify (answer,correct) NE 0 then put 'INCORRECT DATA ENTRY' _N_ answer;
datalines;
ACEAA
ABCDE
abcde
AAAAA
AGHRB
ABCDR
;
/******************************************
proc print;
run;
/*********************************************
data temp6;
length answer $5 a1-a5 $1;
input answer $;
array x[5] a1-a5;
do k=1 to 5;
	x[k]=substr(answer,k,1);
end;
drop k;
datalines;
ACEAA
ABCDE
aaaaa
AAAAA
AGHAB
;
proc print;
run;

quit;
