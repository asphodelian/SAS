/***HW 6***GAbrielle Salamanca***/
options nodate;
/*********/
proc format;
value $ gender 'M' = 'Male'
			   'F' = 'Female'
			   ' ' = 'N/A';

value polpart 1 = 'Republican'
			  2 = 'Democrat'
			  3 = 'Not registered';

value voting 0 = 'No'
		     1 = 'Yes';

value forpol 0 = 'No'
			 1 = 'Yes';

value domspen 0 = 'No'
			  1 = 'Yes';
run;
/*********/
data survey;
infile '\\Client\D$\M338 SAS\Data Files\HW6.txt';
input @1 ID 3. @4 Gender $ 1. @5 Party 1. @6 Vote 1. @7 Foreign 1. @8 Spend 1.;
label Party = 'Political party';
label Vote = 'Did you vote in the last election?';
label Foreign = 'Do you agree with the government''s foreign policy?';
label Spend = 'Should we increase domestic spending?';
run;
/*********/
proc print label noobs;
format ID z3. Gender $gender. Party polpart. Vote voting. Foreign forpol. Spend domspen.;
title 'HW 6: Gabrielle Salamanca';
run;
/*********/
quit;
