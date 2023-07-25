libname form '\\Client\D$\M338 SAS\Library';
options FMTSEARCH=(form);
/*******************************************************/
proc format library=form;
value letter 0-<48='F'
             48-<65='D'
             65-<76='C'
             76-<86='B'
             86-100='A';
picture numb 0-<48 ='00 F'
             48-<65='00 D'
             65-<76='00 C'
             76-<86='00 B'
             86-100='00 A';
run;
/*******************************************************/
proc format library=form;
value weightf 	low -100 = 'Light'
				101 - 200 = 'Medium'
				201 - 300 = 'Heavy'
				other = 'Out of range';
picture weightp 0-100 = '000 ' 'Light'
		101 - 200 ='000 ' 'Medium'
		201 - 300 = '000.0 ' 'Heavy'
		OTHER ='000.00 ' 'Other';
run;
/*******************************************************/
proc format library=form;
picture padd low-high = '00000000*' (fill ='*');
picture ssnu low-high = '000-00-0000' ;
run;
/******************************************************/
proc format library=form;
picture perc low-high = '00000%' (mult = 100);
run;
