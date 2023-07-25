option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data allscores;
merge datain.before datain.after;
input score group $;
if datain.before then group = 'Before';
	else group = 'After';
run;
/***************************************/
proc sort data = allscores;
by score;
run;
/***************************************/
proc print data = allscores;
run;
/***************************************/
proc print label;
title 'Q5';
footnote 'End of Q5';
run;
