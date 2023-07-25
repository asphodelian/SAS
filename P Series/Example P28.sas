*options linesize=68 nonumber nodate;
/**********************************************
proc format;
value letter 0-<48='F'
             48-<65='D'
             65-<76='C'
             76-<86='B'
             86-125='A';
picture numb 0-<48 ='000 ' 'F'
             48-<65='000 ' 'D'
             65-<76='000 ' 'C'
             76-<86='000 ' 'B'
             86-125='000 ' 'A';
run;
/*****************************
data temp1;
input grade;
datalines;
25 
48
66
54
92
100
80
123
;
/***********************************************
proc print;
*format grade letter.;
format grade numb.;
title 'picture format';
run;
/**********************************************/
proc format;
value weightf 	low -100 = 'Light'
				101 - 200 = 'Medium'
				201 - 300 = 'Heavy'
				other = 'Out of range';
picture weightp 0-100 =     '000.000   ' ' Light '
				101 - 200 = '000.000   ' 'Medium'
				201 - 300 = '000.000   ' ' Heavy '
				OTHER =     '00000.000   ' ' Error ';
run;
/*********************************************
data temp2;
input weight;
datalines;
35
66000
-2200
194
200.3
82
255
320.4
145
;
/******************************
proc print;
format weight weightf.;
run;
/*****************************
proc print;
format weight weightp.;
run;
/*************************************************
proc format;
picture ssnu low-high = '000-00-0000' ;
*picture padd low-high = '000099999' (fill ='$');
picture padd low-high = '000000000' (fill = '$');
*picture padd low-high = '0000000$*';
*picture padd low-high = '099990000' (fill='@');
*picture padd low-high = '0000000**' (fill ='@');
run;
/*************************************************
data temp3;
input ssn pssn 2-5;
datalines;
560367989
566285679
;
proc print;
*format ssn ssn.;
format ssn ssnu.;
*format ssn ssnu. pssn padd.;
format pssn padd.;
*format ssn ssnu. pssn padd.;
run;
/*********************************************/
proc format;
*picture perc low-high = '9.99';
picture perc low-high = '00000' (mult = 100);
*picture perc low-high = '00000%' ;
run;
/*********************************************/
data temp4;
input x;
datalines;
0.23
0.4
0.79
;
proc print;
format x perc.;
run;
/*********************************************/
quit;
