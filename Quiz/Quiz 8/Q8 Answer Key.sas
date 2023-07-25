option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
proc format;
value continent 100-199='Asia'
                200-299='Oceania'
                300-399='N. America'
                400-499='S. America'
                500-599='Africa'
				600-699='Europe';
/***************************************/
data q8;
infile '\\Client\D$\M338 SAS\Data Files\q8 data.txt';
input ID 3. Country $;
run;
/***************************************/
proc print noobs;
var Country ID;
format ID continent.;
title 'Q8';
footnote 'End of Q8';
run;
/***************************************/
