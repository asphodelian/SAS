option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********/
PROC IMPORT 
OUT = temp1
DATAFILE= "\\Client\D$\M338 SAS\Data Files\q10.xlsx"
DBMS=xlsx REPLACE;
RUN;
/*********/
data temp2;
set temp1 (keep = Minutes MajorName);
file '\\Client\D$\M338 SAS\Data Files\q10.txt';
input Minutes MajorName $;
if Minutes = ' ' then Minutes = '0';
run;
/*********/
proc print;
title 'Q10';
footnote 'End of Q10';
run;
/*********/
quit;
