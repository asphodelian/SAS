libname thornton '\\Client\D$\M338 SAS';
/***************************************/
data matrix;
infile '\\Client\D$\M338 SAS\Quiz\q1.txt' dlm=',';
datalines;
input x1 $ x2 x3;
label x1 = 'Gender';
label x2 = 'Exam Score';
label x3 = 'GPA'
run;
/***************************************/
proc print data = label noobs;
run;
/***************************************/
footnote 'End of Program';
