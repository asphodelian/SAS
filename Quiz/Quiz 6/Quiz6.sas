option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
data Q6;
infile '\\Client\D$\M338 SAS\Data Files\q6data.txt';
input name: & $19. x1 5.0 x2 8.0 date MMDDYY8. x3 4.0;
run;
/***************************************/
proc print;
format date MMDDYY8. x3;
run;
/***************************************/
title 'Q6';
footnote 'End of Q6';
quit;
