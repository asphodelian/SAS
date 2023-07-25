libname sasin '\\Client\D$\M338 SAS\Data Files';
/**********************************************/
proc format;
value gend	2 = 'Female'
			1 = 'Male';
value succ	4,5,6 = '1Success'
			1,2,3 = '2Failure';
run;
/**********************************************/
data workers;
set sasin.workers;
run;
/**********************************************/
proc contents;
run;
/**************************************************
/****    One Sample Proportion Confidence Interval
/**************************************************
*ods select BinomialProp BinomialPropTest;
proc freq order=formatted;
*proc freq data=workers;
*table sex;
*table sex ed age;
tables sex / binomial ;
format sex gend.;
run;
/**********************************************
*ods select BinomialProp BinomialPropTest;
*proc freq order = formatted;
proc freq order=formatted;
tables sex / binomial;
format sex gend.;
*Title 'Female';
run;
/***********************************************
/****       One Sample Proportion Testing
/***********************************************
proc sort;
by descending ed;
run;
/***********************************************
*proc freq;
proc freq order=formatted;
*tables ed;
tables ed /binomial (p=0.69) ;
format ed succ. ;
run;
/**********************************************/
*ods select BinomialProp BinomialPropTest;
proc freq ;
*tables sex;
tables sex / binomial (p=0.54) ;
tables sex / testp = (54 46) ;
format sex gend.;
run;
/***********************************************
       
