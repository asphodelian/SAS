/***HW 8***Gabrielle Salamanca***/
options nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********/
proc format;

value letter	0-<48 = 'F'
            	48-<65 = 'D'
            	65-<76 = 'C'
            	76-<86 = 'B'
            	86-100 = 'A'; 

picture numb 0-<48 ='000 ' 'F'
             48-<65='000 ' 'D'
             65-<76='000 ' 'C'
             76-<86='000 ' 'B'
             86-125='000 ' 'A';

run;
/****HW7*Data****/
data datain.S1 datain.S3;
infile '\\Client\D$\M338 SAS\Data Files\hw7.txt';
input Course $1-4 Section 5 ID 6-7 Name $;

if Section = 1 then do;
	input  Quiz1-Quiz6 / HW1-HW3;

	Quiz = Quiz1+Quiz2+Quiz3+Quiz4+Quiz5+Quiz6;
	HW = HW1+HW2+HW3;

	Quizzes = (Quiz/60)*0.25;
	QuizGrade = Quizzes*100;

	HWS = (HW/45)*0.15;
	HWGrade = HWS*100;

	output datain.S1;
end;

if Section = 3 then do;
	input  HW1-HW4 / Quiz1-Quiz7;

	Quiz = Quiz1+Quiz2+Quiz3+Quiz4+Quiz5+Quiz6+Quiz7;
	HW = HW1+HW2+HW3+HW4;

	Quizzes = (Quiz/70)*0.20;
	QuizGrade = Quizzes*100;

	HWS = (HW/60)*0.20;
	HWGrade = HWS*100;
	output datain.S3;
end;

run;
/***S1-S2***Test***
proc print data = datain.S1 noobs;
var Course ID Name QuizGrade HWGrade;
format ID z2.;
title 'Section 1 Gradebook';
run;
proc print data = datain.S3 noobs;
var Course ID Name QuizGrade HWGrade;
format ID z2.;
title 'Section 3 Gradebook';
run;
/****HW8*Data****/
data datain.Sec1 datain.Sec3;
infile '\\Client\D$\M338 SAS\Data Files\hw8.txt';
input Course $1-4 Section 5 ID 6-7 Name $;

if Section = 1 then do;
	input  Exam1 Exam2 / Final;

	Ex1 = (Exam1/50)*0.20;
	Ex2 = (Exam2/50)*0.20;
	Fin = (Final/50)*0.20;

	Ex1Grade = Ex1*100;
	Ex2Grade = Ex2*100;
	FinalGrade = Fin*100;

	output datain.Sec1;
end;

if Section = 3 then do;
	input  Midterm / Final;

	MT = (Midterm/40)*0.30;
	Fin = (Final/50)*0.30;

	MidtermGrade = MT*100;
	FinalGrade = Fin*100;

	output datain.Sec3;
end;

run;
/***Sec1-Sec3***Test***
proc print data = datain.Sec1 noobs;
var Course ID Name Ex1Grade Ex2Grade FinalGrade;
format ID z2.;
title 'Section 1 Gradebook';
run;
proc print data = datain.Sec3 noobs;
var Course ID Name MidtermGrade FinalGrade;
format ID z2.;
title 'Section 3 Gradebook';
run;
/*********/
data datain.Section1;
merge datain.Sec1 datain.S1;
Grade = QuizGrade+HWGrade+Ex1Grade+Ex2Grade+FinalGrade;
Percent = QuizGrade+HWGrade+Ex1Grade+Ex2Grade+FinalGrade;
label Percent = '%';
run;
/*********/
proc print label noobs;
var Course ID Name QuizGrade HWGrade Ex1Grade Ex2Grade FinalGrade Percent Grade;
format ID z2. Grade letter.;
title 'Section 1 Gradebook';
run;
/*********/
data datain.Section3;
merge datain.Sec3 datain.S3;
Grade = QuizGrade+HWGrade+MidtermGrade+FinalGrade;
Percent = QuizGrade+HWGrade+MidtermGrade+FinalGrade;
label Percent = '%';
run;
/*********/
proc print label noobs;
var Course ID Name QuizGrade HWGrade MidtermGrade FinalGrade Percent Grade;
format ID z2. Grade letter.;
title 'Section 3 Gradebook';
run;
/*********/
quit;
