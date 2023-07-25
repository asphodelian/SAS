/***HW 9***Gabrielle Salamanca***/
options nodate;
/*********/
proc format;

value letter	0-<40 = 'F'
            	40-<50 = 'D'
            	50-<55 = 'C-'
            	55-<68 = 'C'
            	68-<75 = 'C+'
				75-<80 = 'B-'
				80-<84 = 'B'
				84-<87 = 'B+'
				87-<90 = 'A-'
				90-100 = 'A'; 
run;
/*********/
PROC IMPORT
OUT = Grades
DATAFILE = '\\Client\D$\M338 SAS\Data Files\HW9.xlsx'
DBMS = xlsx REPLACE;
GETNAMES = YES;
run;
/****HW9*Data****/
data HW9;
set Grades;

array change _numeric_;
	do over change;
		if change = '.' then change = 0;
	end;

call sortn(of Q1-Q9);
    Q = (mean(of Q3-Q9)/10);
call sorth(of H1-H14);
	H = (mean(of H3-H14)/10);

T = T1+T2+T3;
Test = T/300;
Quiz = Q*100;
HW = H*100;

if HW > Quiz then do;
	Total = 0.25*T+0.15*HW+0.1*Quiz;
	TotalD = Total/100;
	end;
else do;
	Total = 0.25*T+0.15*Quiz+0.1*HW;
	TotalD = Total/100;
	end;

Final = Total;

label First = 'First Name' 
	  Last = 'Last Name' 
	  Q = 'Quiz' 
	  H = 'HW' 
	  TotalD = 'Total %'
	  Final = 'Final Grade';

run;
/*********/
proc print label noobs;

var First Last Q H Test TotalD Final;
format Q percent10. H percent10. Test percent10. TotalD percent10. Final letter.;
title 'HW 9: Gabrielle Salamanca';

run;
/*********/
quit;
