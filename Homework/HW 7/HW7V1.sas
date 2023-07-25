/***HW 7***Gabrielle Salamanca***/
options nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********/
data datain.S1 datain.S3;
infile '\\Client\D$\M338 SAS\Data Files\hw7.txt';
input Course $1-4 Section 5 ID 6-7 Name $;

if Section = 1 then do;
	input  Quiz1-Quiz6 / HW1-HW3;
	output datain.S1;
end;

if Section = 3 then do;
	input  HW1-HW4 / Quiz1-Quiz7;
	output datain.S3;
end;

run;
/*********/
proc print data = datain.S1 noobs;
var Course ID Name Quiz1-Quiz6 HW1-HW3;
format ID z2.;
title 'Section 01 Gradebook';
run;
/*********/
proc print data = datain.S3 noobs;
var Course ID Name HW1-HW4 Quiz1-Quiz7;
format ID z2.;
title 'Section 03 Gradebook';
run;
/*********
data S1;

infile '\\Client\D$\M338 SAS\Data Files\hw7.txt';
input Course $1-4 Section 5 ID 6-7 Name $
	  / Quiz1-Quiz6 
	  / HW1-HW3;
if Section = 1 then output;

run;
/*********
data S3;

infile '\\Client\D$\M338 SAS\Data Files\hw7.txt';
input Course $1-4 Section 5 ID 6-7 Name $ 
	  / HW1-HW4 
	  / Quiz1-Quiz7;
if Section = 3 then output;
if 
run;
/*********
proc print data = S1 noobs;
var Course ID Name Quiz1 Quiz2 Quiz3 Quiz4 Quiz5 Quiz6 HW1 HW2 HW3;
format ID z2.;
title 'Section 01 Gradebook';
run;
/*********
proc print data = S3 noobs;
var Course ID Name HW1 HW2 HW3 HW4 Quiz1 Quiz2 Quiz3 Quiz4 Quiz5 Quiz6 Quiz7;
format ID z2.;
title 'Section 03 Gradebook';
run;
/*********/
quit;
