libname datain '\\Client\D$\M338 SAS\Data Files';
/****************************************************/
data statedat;
*data datain.statedat;
*data 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\statedata';
length state $ 35.0 region $ 10.0;
infile '\\Client\D$\M338 SAS\Data Files\edited statedata.txt';
input state $ region $ visits salesman sale expenses;
*input state & region visits salesman sale expenses;
label	state = 'State Name'
		region = 'Region Assignment'
		visits = 'Visits From Regional Manager'
		salesman = 'Number Of Salesmen'
		sale = 'Gross Sales For Last Quarter'
		expenses = 'Advertising Expenses For Last Quarter';
run;
/***************************************************
*proc contents data=datain.statedat;
proc contents;
run;
/**************************************************/
Proc print data=datain.statedat label;
*proc print label;
run;
/**************************************************/
quit;
