/***HW 5***Gabrielle Salamanca***/
options nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********/
data ONE;

infile '\\Client\D$\M338 SAS\Data Files\one.txt';
informat DOB mmddyy8.;
input ID Sex $ DOB Salary;

run;
proc sort;
by ID;
run;
proc print noobs;
format ID z2. Sex DOB mmddyy8. Salary;
run;
/*********/
data TWO;

infile '\\Client\D$\M338 SAS\Data Files\two.txt';
informat DOB mmddyy8.;
input IDNum Sex $ DOB Salary Taxrate Withhold;

run;
proc sort;
by IDNum;
run;
proc print noobs;
format IDNum z2. Sex DOB mmddyy8. Salary Taxrate Withhold;
run;
/*********/
data THREE;

infile '\\Client\D$\M338 SAS\Data Files\three.txt';
informat DOB mmddyy8.;
input ID Sex $ DOB Salary Height Weight;

run;
proc sort;
by ID;
run;
proc print noobs;
format ID z2. Sex DOB mmddyy8. Salary Height Weight;
run;
/***HW 5.A***Gabrielle Salamanca***
data ALL;
merge ONE TWO THREE (RENAME = (IDNum=ID) );
input ID Sex $ DOB Salary Height Weight Taxrate Withhold;
run;
proc sort;
by ID;
run;
proc print noobs;

var ID DOB Salary;
format ID z2. DOB MMDDYY8. Salary 5.;
title 'HW 5.A: Gabrielle Salamanca';

run;
/***HW 5.B***Gabrielle Salamanca***
data datain.after datain.before;

set ALL;
if DOB >= 0 Salary >= 50000 then output datain.before;
if DOB < 0 then output datain.after;

run;
proc print data = datain.before noobs;
title 'HW 5.B: Gabrielle Salamanca';
run;
/*********/
quit
