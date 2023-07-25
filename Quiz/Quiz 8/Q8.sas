option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***************************************/
proc format;
value continent 100-<200='Asia'
                300-<400='North America'
                400-<500='South America'
                500-<600='Africa'
                600-700='Europe';
/***************************************/
data q8;
infile '\\Client\D$\M338 SAS\Data Files\q8 data.txt';
input ID 3. Country $;
run;
/***************************************/
proc print noobs;
format ID continent. Country;
title 'Q8';
footnote 'End of Q8';
run;
/***************************************/
