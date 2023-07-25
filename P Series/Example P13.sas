options nodate ;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********************************************/
*data temp;
*data datain.female;
*set datain.nhanes2006;
*keep seqn rigendr;
data datain.male datain.female;
*data datain.male datain.female;
set datain.nhanes2006 (keep=seqn riagendr); /*preferred for massive dataset*/

*data datain.male2006;
*data datain.one;

*data datain.female datain.male;
*set datain.nhanes2006 (keep = seqn riagendr ridreth1) ;
*set datain.nhanes2006 (drop = ) ;
*keep seqn riagendr ridreth1 ;
*drop riagendr ridreth1;
*if (ridreth1=2 or ridreth1=5) then delete;
*if (ridreth1=1 or ridreth1=3 or ridreth1 = 4) then output;
*if ridreth1=2 then delete;
*if riagendr = 2 then delete;
*if riagendr = 1 then output;
*if riagendr = 1 then delete;
if riagendr = 1 then output datain.male;
	else output datain.female;
*if riagendr = 2 then output datain.female;
*drop riagendr;
*bmxwt = 2.205 * bmxwt;
run;
/*********************************************/
proc contents data=datain.female;
*proc contents data=datain.nhanes2006;
*proc contents data = temp;
*title 'female';
run;
/*********************************************/
proc print data = datain.female (obs=100);
run;
/*********************************************
proc freq data=datain.female;
tables riagendr;
run;
/*********************************************

proc print data=datain.nhanes2006 (obs=25);
var bmxwt;
run;
/****************************************
proc print data=datain.male;
title 'Male';
run;
proc print data=datain.female;
title 'Female';
run;
/****************************************
proc freq ;
tables riagendr ridreth1 riagendr*ridreth1;
run;
/*********************************************
proc print data=datain.male;
title 'males';
run;
/*********************************************
proc contents data=datain.male2006;
run;

proc freq;
tables riagendr ridreth1;
run;

/*********************************************
proc print data=datain.nhanes2006(obs=10);
title 'all';
run;
/*******************************************
proc contents data=datain.fema2006;
run;
proc print data=datain.fema2006(obs=100);
*var riagendr;
run;
/**********************************************
proc freq data=datain.male2006;
table riagendr ridreth1;
run;
/**********************************************
proc print data=datain.male(obs=50) label;
title "Male";
run;
/***********************************************
proc print noobs label data=datain.female(obs=50) ;
title ;
run;
/***********************************************
proc print label data=datain.nhanes2006(obs=5);
run;
/***********************************************
proc freq;
tables riagendr ridreth1 riagendr*ridreth1;
run;
/***********************************************/
quit;
