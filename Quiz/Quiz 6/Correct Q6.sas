option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data Q6;
informat x1 comma.;
infile '\\Client\D$\M338 SAS\Data Files\q6data.txt';
input name $18. x1 x2 date MMDDYY8. x3;
run;
/***************************************/
proc print;
var name x1 x2 date x3;
format x1 comma8. x2 10.4 date MMDDYY8. x3 z4.;
run;
/***************************************/
title 'Q6';
footnote 'End of Q6';
quit;
