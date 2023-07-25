/*
Example 1
*/
data today; /*hello */
input serious  $
	live $ 
	mode $ 
	count;
*title "today's program";
label mode = 'Mode of Transportation';
datalines ;
yes died helicop 48
yes died road 60
yes survive helicop 52
yes survive road 40
no died helicop 16
no died road 200
no survive helicop 84
no survive road 800
;
run;
/*****************************************/
proc print;
*,title 'Program1';
*title;
footnote 'End of Program1';
*footnote ' ';
title2 "results of proc print";
*title3 "Simpson's Paradox";
*title2 "Example 1";
*footnote 'End of example 1';
*footnote2 'Really the end';
run;
/*********************************************************/
proc freq;
*title ;
weight count;
*tables serious live mode;
tables live*mode / nopercent norow;
tables serious*live*mode / nopercent norow;
*title2 'results of proc freq';
*tables live*mode / nopercent norow;
*tables serious*live*mode / nopercent norow;
*title 'proc freq';
*footnote 'End of example 1';
run;
/*********************************************************
proc freq;
weight count;
where serious ='no';
tables live*mode;
title 'serious=no';
run;
/*********************************************************
proc freq;
weight count;
where serious ='yes';
tables live*mode;
title ;
run;
/*********************************************************/
proc tabulate format=5.0;
freq count;
class serious live mode;
var count;
table live all='Total',serious*mode ;
*title 'Proc tabulate';
run;
/**********************************************************/


quit;
