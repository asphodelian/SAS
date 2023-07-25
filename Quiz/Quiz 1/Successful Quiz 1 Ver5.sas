libname thornton '\\Client\D$\M338 SAS';
/***************************************/
data matrix;
infile '\\Client\D$\M338 SAS\Quiz\q1.txt' dlm=',';
input x1 $ x2 x3;
label x1 = 'Gender';
label x2 = 'Exam Score';
label x3 = 'GPA'
run;
/***************************************/
proc print data = matrix;
run;
/***************************************/
footnote 'End of Program';
