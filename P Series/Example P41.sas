libname sasin '\\Client\D$\M338 SAS\Data Files';
/******************************************/
proc format;
value gend	2 = 'Female'
		    1 = 'Male';
value succ	4,5,6 = 'Success'
		    1,2,3 = 'Failure';
value coll  4 = 'some college'
            5 = 'BA degree'; 
value edt	2 = 'some HS'
			3 = 'HS diploma';
run;
/******************************************/
data worker;
set sasin.workers;
run;
/******************************************/
proc print;
run;
/******************************************
*ods select OneWayChiSq;
proc freq;
*tables age ed sex sex*ed;
tables sex / chisq;
format sex gend.;
run;
/******************************************
proc freq;
*where ed = 4 or ed = 5;
tables ed / chisq;
*format ed coll.;
format ed succ.;
run;
/*****************************************
proc freq;
tables ed / chisq;
tables sex*ed / riskdiff;
format ed succ. sex gend.;
run;
/******************************************
proc freq;
where ed = 2 or ed = 3;
tables ed / chisq;
format ed edt.;
run;
