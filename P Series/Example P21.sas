options nodate nonumber;
/******************************************************
data temp0;
*informat id ssn. ;
informat d MMDDYY12.;
input id d cost;
*input id d $ cost;
*input id  d MMDDYY8.  cost ;
*today = date();
*format today mmddyy10.;
*bdays = today - d;
*format bdays mmddyy10.;
*age = bdays / 365 ;
*age1=floor(bdays/365);
*age2=floor((intck('month',d,today)-(day(today) < day(d)))/12);


datalines;
999698888 10/12/53 4300
028754989 01/01/60 3455
888599999 09/01/96 834003
749580209 03/05/97 240
;
run;
/**************************************************
proc contents;
run;
/**************************************************
proc print;
run;
/**************************************************
proc print;
format d MMDDYY10.;
run;
/*****************************************************
proc print;
format id ssn. d MMDDYY10. cost dollar10.;
run;
/*****************************************************/
data temp1;
*length lastname $13;
*informat lastname $20. dob mmddyy12.;
*informat lastname $60.;
*informat lastname $50. dob mmddyy8. gender $2.;
*input id lastname dob height  weight  gender $ age ;
*input id lastname $50. dob mmddyy10.height weight gender $ age;
input id lastname : $50. dob : mmddyy10. height weight gender $ age;
datalines;
13 smith 1/23/66 68 144 M 26
28 Ng 3/14/60 78 202 M 32
37 Jackson 10/15/49 63 99 F 45
42 Harper-Senior 8/2/73 69 105 F 22
;
run;
proc print;
format dob mmddyy10.;
run;
/***********************************************/
proc contents;
run;
/***********************************************
proc print;
format dob mmddyy10.;
*format lastname $12. dob mmddyy12.;
run;
/************************************************/
quit;
