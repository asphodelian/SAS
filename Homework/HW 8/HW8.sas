/***HW 8***Gabrielle Salamanca***/
options nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********/
proc format;

value exams	0-<48='F'
            48-<65='D'
            65-<76='C'
            76-<86='B'
            86-100='A'; 

run;
/*********/
data datain.Sec1 datain.Sec3;
infile '\\Client\D$\M338 SAS\Data Files\hw8.txt';
input Course $1-4 Section 5 ID 6-7 Name $;

if Section = 1 then do;
	input  Exam1 Exam2 / Final;
	*Score1 = (Exam1/50)*0.20;
	*Score2 = (Exam2/50)*0.20;
	*Fin = (Final/50)*0.20;
	output datain.Sec1;
end;

if Section = 3 then do;
	input  Midterm / Final;
	*MT = (Midterm/40)*0.30;
	*Fin = (Final/50)*0.30;
	output datain.Sec3;
end;

run;
/*********/
proc print data = datain.Sec1 noobs;
var Course ID Name Exam1 Exam2 Final;
format ID z2.;
title 'Section 01 Gradebook: Finals';
run;
proc print data = datain.Sec3 noobs;
var Course ID Name Midterm Final;
format ID z2.;
title 'Section 03 Gradebook: Finals';
run;
/*********/
data datain.S1 datain.S3;
infile '\\Client\D$\M338 SAS\Data Files\hw7.txt';
input Course $1-4 Section 5 ID 6-7 Name $;

if Section = 1 then do;
	input  Quiz1-Quiz6 / HW1-HW3;
	*Quiz = ((Quiz1+Quiz2+Quiz3+Quiz4+Quiz5+Quiz6)/60)*0.25;
	*HW = ((HW1+HW2+HW3)/45)*0.25;
	output datain.S1;
end;

if Section = 3 then do;
	input  HW1-HW4 / Quiz1-Quiz7;
	*Quiz = ((Quiz1+Quiz2+Quiz3+Quiz4+Quiz5+Quiz6+Quiz7)/70)*0.25;
	*HW = ((HW1+HW2+HW3+HW4)/60)*0.25;
	output datain.S3;
end;

run;
/*********/
proc print data = datain.S1 noobs;
var Course ID Name Quiz1-Quiz6 HW1-HW3;
format ID z2.;
title 'Section 01 Gradebook: Quiz & HW';
run;
proc print data = datain.S3 noobs;
var Course ID Name HW1-HW4 Quiz1-Quiz7;
format ID z2.;
title 'Section 03 Gradebook: Quiz & HW';
run;
/*********/
data datain.Section1;
merge datain.Sec1 datainS1;
run;
/*********/
quit;
