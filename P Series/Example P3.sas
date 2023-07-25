libname thornton 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data';
/**************************************************/
data abcd;
*data 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\out_space';
*data thornton.out2_space;
*data thornton.abcd;
*infile datalines;
*infile datalines delimiter ='!';
*infile 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\space.txt';
*infile 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\comma.txt';
*infile 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\comma.txt' dlm=',' ;
*infile 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\tab.txt' dlm='09'X ;
*infile datalines dlm=',';
*infile datalines dlm='!';
*infile datalines dlm='	';
input name $ q1 q2;
;
run; 
/***********************************************************/
proc print;
*proc print data=abcd (obs=2);
run;
/************************************************************
proc print data=thornton.abcd (obs=1);
run;
/************************************************************
proc print data = 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\abcd';
run;
