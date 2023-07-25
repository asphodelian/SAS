*options nonumber nodate;
/*************************************************
data temp1;
input ssn  name $ @1 fssn 6.0 @5 lssn 4.0;
*input id name $;
datalines;
999698888 smith
888599999 brown
749580209 kafai
023946789 Chung
;
/************************************************
proc contents;
run;
/************************************************
proc print;
format ssn ssn.;
run;
/************************************************
data temp2;
a = -2;
*input ssn  name $ @1 fssn 6.0 @5 lssn 4.0;
input ssn  name $ @1 fssn 6. +a lssn 4.;
drop a;
datalines;
999698888 smith
888599999 brown
749580209 kafai
023946789 Chung
;
run;
/************************************************
proc contents;
run;
/************************************************
proc print;
format ssn ssn. fssn z6.;
run;
/**********************************************
data temp3;
input name $1-10 gender $11 class $12-17 (q1-q3) (2.);
datalines;
Jo JacksonMSenior10 97          
sue BarkerFFresh 9 9 10
;
run;
proc print;
run;
/***************************************
data temp4;
input name $15.;
datalines;
       James Smith
John   Brown
;
proc contents;
run;
proc print;
run;
/******************************************
data temp6;
input name $ char17.;
datalines;
       James Smith    
John   Brown
;
run;
proc contents;
run;
proc print;
run;
/*******************************************
data temp7;
input score comma6;
datalines;
23,324
6,522
;
proc contents;
run;
proc print;
*format score dollar10.;
run;
/********************************************
data temp8;
input id 9. date $ cost;
datalines;
999698888  10/12/93             4300
888599999  09/01/96            8340
749580209  9/1/97               241
023946789  12/23/93            43
;
run;
proc contents;
run;
proc print;
format id ssn. date cost ;
run;
 /********************************************/
data temp9;
input @1 id 9. @12 date MMDDYY8. @32 cost 8.4;
datalines;
999698888  10/12/93             4300
888599999  09/01/96            83400
749580209  9/1/97               241 
023946789  12/23/93            43
;
proc contents;
run;
proc print;
format id ssn. date MMDDYY8. cost;
run;


