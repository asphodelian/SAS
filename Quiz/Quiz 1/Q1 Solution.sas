data q1;
infile '\\Client\D$\M338 SAS\Quiz\Quiz 1\q1.txt' dlm=',';
input x1 $ x2 x3;
label x1 = 'Gender'
	  x2 = 'Exam SCore'
	  x3 = 'GPA';
run;
/***************************************/
proc print label;
title 'Q1';
footnote 'End of Q1';
run;
