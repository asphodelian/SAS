data ba;
infile '\\Client\D$\M338 SAS\Data Files\BeforeAfter Data.txt';
input id before after;
diff = before - after;
run;
/********************************************/
proc print;
run;
/*********************************************
proc univariate;
var diff;
run;
/***************************************/
proc ttest;
*paired after*before;
paired before*after;
run;
