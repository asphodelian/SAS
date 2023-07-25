/***HW 9***Gabrielle Salamanca***/
options nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
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
				90-<100 = 'A'; 
run;
/****HW9*Data****/
data HW9;
infile '\\Client\D$\M338 SAS\Data Files\HW9.xlsx';
input FirstName $ LastName $ Q1-Q9 HW1-HW14 T1-T3;

array change _numeric_;
	do over change;
		if change = ' ' then change = 0;
	end;

call sortn(of Q1-Q9);
    Q = mean(of Q3-Q9)/10*100;
call sorth(of H1-H14);
    H = mean(of H3-H14)/10*100;

*Quiz = Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8+Q9;
*HW = HW1+HW2+HW3+HW4+HW5+HW6+HW7+HW8+HW9+HW10+HW11+HW12+HW13+HW14;
*Test = T1+T2+T3;

*Quizzes = (Quiz/90)*100;
*HWS = (HW/140)*100;
*Tests = (Test/300)*100;
*Total = Quizzes+HWS+Tests;
*Final = Total;
*Total = 0.25*(Test) + 0.15*max(HW,Quiz) + 0.10*min(HW,Quiz);

run;
proc print label noobs;
var Q H;
*var FirstName LastName Quizzes HWS Tests Total FinalGrade;
*format FinalGrade letter.;
title 'Gradebook';
run;
/*********/
quit;
