option nodate;
libname datain '\\Client\D$\M338 SAS\Data Files';
/***********************************************/
data datain.undergradQ;
infile '\\Client\D$\M338 SAS\Data Files\undergradQ.txt' dlm=',';
input id gender $ q1 q2 q3 q4;
run;
proc print;
title 'Undergraduate Quiz scores';
run;
/***********************************************/
data datain.undergradH;
infile '\\Client\D$\M338 SAS\Data Files\undergradH.txt' dlm=',';
input id h1 h2 h3 h4;
run;
proc print;
title 'Undergraduate Homework scores';
run;
/**********************************************/
data datain.gradQ;
infile '\\Client\D$\M338 SAS\Data Files\grad.txt' dlm=',';
input id gender $ q1 q2 q3 q4;
run;
proc print;
title 'Graduate Quiz scores';
run;
/**********************************************/
quit;
