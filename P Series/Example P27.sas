/***************************************************
proc format;
value abc    0-<48='F'
             48-<65='D'
             65-<76='C'
             76-<86='B'
             86-100='A';

run;
/****************************************************
data temp1;
input grade;
datalines;
25
48 
66
54
92
80
;
run;
proc print;
format grade abc. ;
run;
/*************************************************
proc format;
value weightf 	 0 - <100 = 'Light'
				100 - <200 = 'Medium'
				200 - 300 = 'Heavy'
				other = 'Out of range';
run;
/**************************************************
proc format;
value weightc 	0 -300 = 'OK'
				other = 'Out of range';
run;
/***************************************************
data temp2;
input weight;
datalines;
35
66
-2200
194
200
82
255
320
145
;
proc print;
format weight weightf.;
run;
/*****************************************
proc freq;
tables weight;
format weight weightf.;
run;
/****************************************/
proc format;
value $ replyfi  'y' = 'Yes'
                'n' = 'No';
value $ replyfii  'y', 'Y' = 'Yes'
                'n','N' = 'No'
                other = 'ERROR';
run;
/****************************************/
data temp2;
input reply $; 
*format reply $replyfii. ;
datalines;
y
y
y
n
a
y
n
N
n
Y
;
/*****************/
proc print;
format reply $replyfii. ;
run;
/*****************************************/
proc freq;
format reply $replyfii. ;
*where not(reply = 'n' or reply = 'y') ;
where not(reply = 'No');
table reply;
run;
/*****************************************/
quit;
