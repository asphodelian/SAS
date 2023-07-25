/***************************************
data dat1;
input name $ sex $ age;
put name sex age;
datalines;
Henry M 13
Joe M 14
Mimi F 11
;
/************************************
proc print;
title 'dat1';
run; 
/***********************************
data _null_;
input name $ sex $ age;
put name sex age;
datalines;
Henry M 13
Joe M 14
Mimi F 11
;
/***********************************
proc print ;
title 'null';
run;
/***************************************
data _null_;
input name $ sex $ age;
file 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\data\April30-1.txt';
put name sex ;
datalines;
Henry M 13
Joe M 14
Mimi F 11
;
/*****************************************
proc print;
title 'April30-1';
run;
/*****************************************
data _null_;
input name $ sex $ age;
file 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\data\April30-2.txt';
put name sex;
datalines;
Henry M 13
Joe M 14
Mimi F 11
;
/*******************************************
proc print;
title 'April30-2';
run;
/*******************************************
data _null_;
input name $ sex $ age;
file 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\data\April30-3.txt';
put name 1-10 sex 12 age 14-28;
datalines;
Henry M 13
Joe M 9
Mimi F 11
;
/**************************************
proc print;
title 'April30-3';
run;
/****************************************
data dat5;
input name $ sex $ age;
put name 1-10 sex 12 age 14-15;
datalines;
Henry M 13
Joe M 14
Mimi F 11
;
proc print;
title 'dat5';
run;
/*************************************
data _null_;
input name $ sex $ age;
file print;
*put name 1-10 sex  12 age 17-35;
put name sex age;
datalines;
Henry M 13
Joe M 14
Mimi F 11
;
/**********************************
proc print;
run;
/*************************************/
data _null_;
input name $ weight;
file print;
put name ;
put weight;
datalines;
mona .
ha 124
lay 150
mike 160
james .
lily 120
;
