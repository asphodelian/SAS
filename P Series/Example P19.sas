*options nonumber;
/*this will get a zero*/
/****************************************************/
data undergrad_l_q;
infile datalines dlm=',';
input id gender $ q1 q2 q3 q4;
datalines;
149,F,6,3,7,9
145,M,8,6,5,3
147,F,10,9,9,7
155,F,7,8,9,3
;
/***********************************************/
proc sort data=undergrad_l_q;
by id;
run;
/************************************************/
proc print data=undergrad_l_q;
title 'Undergraduate Lowerclass Quiz';
run;
/************************************************/
data grad_q;
infile datalines dlm=',';
input id gender $ quiz1 quiz2 quiz3 quiz4;
datalines;
545,F,9,7,3,9
547,M,6,8,7,9
549,M,0,10,10,10
;
/********************************************/
proc sort data=grad_q;
by id;
run;
/****************************************************/
proc print data=grad_q;
title 'Graduate Quiz';
run;
/******************************************************/
data ugradgrad;
set undergrad_l_q  grad_q ;
run;
proc print data=ugradgrad;
title 'Undergraduate Graduate Quiz';
run;
/***************************************************/
data undergrad_u_q;
infile datalines dlm=',';
input id gender $ q1 q2 q3 q4;
datalines;
146,M,10,8,7,10
148,F,10,9,9,7
150,F,6,3,7,9
;
/*********************************************/
proc sort data=undergrad_u_q;
*set undergrad_1_q undergrad _u_q ;
*merge undergrad_1_q undergrad _u_q ;
by id;
run;
/******************************************/
proc print data=undergrad_u_q;
title 'Undergraduate Upperclass Quiz';
run;
/*********************************************/
data under_l_u_q;
set undergrad_l_q undergrad_u_q ;
*merge undergrad_l_q undergrad_u_q ;
*by id;
run;
/********************************************/
proc print data=under_l_u_q;
title 'All undergrad Quiz';
run;
/**********************************************/
data undergrad_l_h;
infile datalines dlm=',';
input id h1 h2 h3 h4;
datalines;
145,32,85,72,100
147,100,92,91,75
149,62,33,78,94
;
/***********************************************/
proc sort data=undergrad_l_h;
by id;
run;
/***********************************************/
proc print data=undergrad_l_h;
title 'Undergraduate Lowerclass Homework';
run;
/************************************************/
data undergrad_l_q_h;
merge undergrad_l_q undergrad_l_h;
*merge undergrad_l_h undergrad_l_q;
by id;
run;
/*********************************/
proc print data=undergrad_l_q_h;
title 'Undergraduate Lowerclass Scores';
run;
/************************************************
data undergrad_q_h;
merge under_l_u_q undergrad_l_h;
*merge undergrad_l_h undergrad_l_q;
by id;
run;
/************************************************
proc print data=undergrad_q_h;
title 'Undergraduate Quiz and Homework';
run;

/*************************************************/
data homework;
infile datalines dlm=',';
input id h1 h2 h3 h4;
datalines;
545,90,70,30,90
547,60,80,70,90
549,0,100,100,100
145,32,85,72,100
146,45,88,70,99
147,100,92,91,75
148,76,97,90,68
149,62,33,78,94
150,76,44,87,85
;
/***************************************/
proc sort data=homework;
by id;
run;
/**************************************/
proc print data=homework;
title 'Undergraduate-Graduate Homework';
run;
/*************************************************/
data quiz;
set undergrad_l_q(in=ulq rename=(q1=quiz1 q2=quiz2 q3=quiz3 q4=quiz4)) 
grad_q(in=gq ) undergrad_u_q(in=uuq rename=(q1=quiz1 q2=quiz2 q3=quiz3 q4=quiz4));
by id;
if ulq = 1 then level = 'UnderLower';
	else if gq = 1 then level = 'Grad';
	else if uuq = 1 then level = 'UnderUpper';

if gender = "M" then gender ="Male";
	else gender = "Female";
run;

proc print data=quiz;
title 'quiz scores';
run;

/**********************************************/
proc sort data=quiz;
by id;
run;
proc sort data=homework;
by id;
run;
/**********************************************/
data all;
merge quiz  homework (in=h);
*merge quiz  homework;
by id;
*if h = 1 then output;
run;
proc print data=all;
*var quiz2 id quiz1;
title 'all scores';
run;
/***********************************************/
quit;
