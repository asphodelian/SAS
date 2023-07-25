options nodate ;
libname datain '\\Client\D$\M338 SAS\Data Files';
data datain.chol;
*set datain.Nhanes2006 (firstobs= 10 obs = 25 keep = seqn lbxtc);
set datain.Nhanes2006 (keep = seqn lbxtc);
*if lbxtc=. then delete;
run;
/****************************************************/
proc contents;
run;
/*****************************************************/
proc print label  data=datain.chol(obs=100) ;
title 'Cholesterol data';
run;
/*****************************************************/
data datain.male datain.female;
*set datain.Nhanes2006 (obs = 200 keep = seqn riagendr ridreth1);
set datain.Nhanes2006 (keep = seqn riagendr ridreth1);
if riagendr =1 then output datain.male;
	else output datain.female;
drop riagendr;
run;
/********************************************************/
proc contents data = datain.male;
run;
proc contents data = datain.female;
run;
/********************************************************/
proc print label data=datain.male;
title 'Male data';
run;
/*******************************************************/
proc print label data=datain.female;
title 'Female data';
run;
/********************************************************/
quit;
