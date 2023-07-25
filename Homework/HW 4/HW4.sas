/***HW 4***Gabrielle Salamanca***/
options nodate;
data employ;

infile '\\Client\D$\M338 SAS\Data Files\employ.txt';
informat DOB MMDDYY10.;
input ID Gender $ DOB MMDDYY8.;

run;
/*********
proc print;
var ID Gender DOB;
format ID z2. Gender $1. DOB MMDDYY8.;
title 'employ';
run;
/*********/
data parts;

infile '\\Client\D$\M338 SAS\Data Files\parts.txt';
input Part_NO Price;

run;
/*********
proc print;
title 'parts';
run;
/*********/
data sales;

infile '\\Client\D$\M338 SAS\Data Files\sales.txt';
input ID Trans Part_NO Quantity;

run;
/*********
proc print;
var ID Trans Part_NO Quantity;
format ID z2. Trans Part_NO Quantity;
title 'sales';
run;
/***HW 4.A***Gabrielle Salamanca***/
data NewSales;

merge parts sales;
input ID Trans Part_NO Price Quantity Total;

run;
proc sort;
by ID;
run;
/*********
proc print noobs;
var ID Trans Part_NO Quantity;
format ID z2. Trans Part_NO Quantity;
run;
/*********/
proc means classdata=sales sum maxdec=0;
title 'HW 4.A: Gabrielle Salamanca';
class ID;
var Quantity;
output out = IDS;
run;
/*********
proc print data = NewSales noobs;
var ID Trans Part_NO;
format ID z2. Trans Part_NO;
title 'HW 4.A: Gabrielle Salamanca';
run;
/***HW 4.B***Gabrielle Salamanca***/
data WholeSales;

merge employ NewSales;
informat DOB MMDDYY8.;
input ID Gender $ DOB Trans Part_NO Price Quantity;

run;
proc sort data = WholeSales;
by ID;
run;
proc means data = WholeSales classdata=sales sum maxdec=0;

title 'HW 4.B: Gabrielle Salamanca';
class ID;
var Quantity;
output out=IDS;

run;
/***HW 4.C***Gabrielle Salamanca***/
proc sort data = WholeSales;
by Gender;
run;
proc means data = WholeSales classdata=employ sum maxdec=0;

title 'HW 4.C: Gabrielle Salamanca';
class Gender;
var Quantity;
output out = IDS;

run;
/*********
data HW4_2;
merge employ NewSales;
x=TRANS*T;
run;
proc sort data=NewSales;
by id;
run;
proc means data = HW4_2 classdata=employ sum maxdec=0;
title 'HW4_2';
class id;
var x;
output out=IDS;
run;
quit;
/*********/
quit
