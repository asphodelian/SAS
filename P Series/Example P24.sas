/**********************Column Input**************************/
data temp;
*input name $1-10 gender $11 class $12-17 q1 18-19 q2 20-21 q3 22-23;
input name $1-10 class $12-17 q1 18-19 q2 20-21 gender $11 q3 22-23;
datalines;
Jo JacksonMSenior10 97
sue BarkerFFresh 9 9 10
;

proc contents;
run;

proc print;
run;


quit;
