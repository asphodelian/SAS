options nodate ;
libname datain '\\Client\D$\M338 SAS\Data Files';
data datain.malefem;
*set datain.male datain.female;
length gender $ 6;
set datain.male (in=m) datain.female; 
if m =1 then gender = 'Male';
	else gender = 'Female';
run;
/*****************************************************/
proc contents data=datain.malefem;
run;
/*****************************************************/
proc print data=datain.malefem;
title 'Male-Female data';
run;
/****************************************************/
proc sort data = datain.malefem ;
by seqn;
run;
proc sort data = datain.chol ;
by seqn;
run;
/****************************************************/
data datain.whole;
merge datain.chol datain.malefem ;
by seqn;
run;
/******************************************************/
proc contents;
run;
/******************************************************/
proc print label;
var seqn lbxtc;
title 'All data';
run;
/*****************************************************/
quit;
