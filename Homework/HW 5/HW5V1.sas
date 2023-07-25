/***HW 5***Gabrielle Salamanca***/
options nodate;
libname datain '\\Client\D$\M338 SAS\Data Files\';
/*********/
data ONE;

infile '\\Client\D$\M338 SAS\Data Files\one.txt';
informat DOB MMDDYY8.;
input ID Sex $ DOB MMDDYY8. Salary;

run;
proc sort;
by ID;
run;
/*********/
proc print noobs;
var ID Sex DOB Salary;
format DOB MMDDYY8. ID z2. Sex Salary;
title 'ONE';
run;
/*********/
data TWO;

infile '\\Client\D$\M338 SAS\Data Files\two.txt';
informat DOB MMDDYY8.;
input IDNum Sex $ DOB Salary Taxrate Withhold;

run;
proc sort;
by IDNum;
run;
/*********
proc print noobs;
var IDNum Sex DOB Salary Taxrate Withhold;
format DOB MMDDYY8. IDNum z2. Sex Salary Taxrate Withhold;
title 'TWO';
run;
/*********/
data RETWO;
set TWO (rename=(IDNum=ID));
run;
/*********/
proc print noobs;
var ID Sex DOB Salary Taxrate Withhold;
format DOB MMDDYY8. ID z2. Sex Salary Taxrate Withhold;
title 'RETWO';
run;
/*********/
data THREE;

infile '\\Client\D$\M338 SAS\Data Files\three.txt';
informat DOB MMDDYY8.;
input ID Sex $ DOB Salary Height Weight;

run;
proc sort;
by ID;
run;
/*********/
proc print noobs;
format DOB MMDDYY8. ID z2. Sex Salary Height Weight;
title 'THREE';
run;
/***HW 5.A***Gabrielle Salamanca***/
data ALL;
merge ONE RETWO THREE;
informat DOB MMDDYY8.;
run;
/*********
proc sort;
by ID;
run;
proc print;
run;
/*********/
proc sort;
by ID;
run;
proc print noobs;

var ID DOB Salary;
format DOB MMDDYY8. ID z2. Salary;
title 'HW 5.A: Gabrielle Salamanca';

run;
/***HW 5.B***Gabrielle Salamanca***/
data datain.after datain.before;

set ALL;
if DOB >= 0 Salary >= 50000 then output datain.before;
if DOB < 0 then output datain.after;

run;
proc print data = datain.before noobs;
title 'HW 5.B: Gabrielle Salamanca';
run;
/*********/
quit;
