option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data allscores;
merge datain.before (in=bef) datain.after;
if bef=1 then group = 'Before';
	else group = 'After';
run;
/***************************************/
proc sort data = allscores;
by score;
run;
/***************************************/
proc print;
run;
/***************************************/
proc print label;
title 'Correct Q5';
footnote 'End of Q5';
run;
