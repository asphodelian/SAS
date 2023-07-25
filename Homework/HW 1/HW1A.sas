/***** Q1A ** Gabrielle Salamanca *****/
option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*************************************
proc print label data = datain.hw1;
run;
/***************************************************
proc gchart data = datain.hw1;
vbar region;
title 'Question 1A.i: Gabrielle Salamanca';
run;
/***************************************************
proc gchart data = datain.hw1;
vbar visits / discrete space = 0 type = percent;
title 'Question 1A.ii: Gabrielle Salamanca';
run;
/***************************************************
proc gchart data = datain.hw1;
vbar visits / discrete space = 0 subgroup = region;
title 'Question 1A.iii: Gabrielle Salamanca';
run;
/***************************************************
proc gchart data = datain.hw1;
vbar region / subgroup = visits;
title 'Question 1A.iv: Gabrielle Salamanca';
run;
/***************************************************
proc gchart data = datain.hw1;
vbar region / sumvar = sale;
title 'Question 1A.v: Gabrielle Salamanca';
run;
/***************************************************
proc gchart data = datain.hw1;
vbar region / sumvar = expenses;
title 'Question 1A.vi: Gabrielle Salamanca';
run;
/***************************************************/
proc gchart data = datain.hw1;
block region / group = visits sumvar = sale type = mean; 
*block visits / group = region sumvar = sale type = mean;
title 'Question 1A.vii: Gabrielle Salamanca';
run;
/***************************************************
proc print label data = datain.hw1;
title 'Question 1A';
run;
/***************************************************/

quit;
