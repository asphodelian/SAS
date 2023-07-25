options nodate linesize = 132 formdlim='-';
data temp;
input x1/x2/x3/x4/x5/x6/x7/x8/x9/x10/x11;
datalines;
-10000.000000
-1000.000000
-5.000000
-1.234500
-0.500000
0.000000
0.500000
1.234500
5.000000
1000.000000
10000.000000
;
run;
/* 10.,9.,7.,5.,3.,2.,1.,10.0,10.2,10.3,10.4,10.5,comma10.,comma10.2
   comma8.,comma8.2,e6.,e5.,e4.,best10.,best7.,best5.,best3.,
   dollar10.,dollar10.2,dollar8.2,dollar8.,z10.2,z10.3,z10.4,z10.5
*/
/************************/
proc print;
title 'SAS default';
run;
/************************/
proc print;
format x1-x11 10.;
title '10.';
run;
/************************/
proc print;
format x1-x11 9.;
title '9.';
run;
/************************/
proc print;
format x1-x11 7.;
title '7.';
run;
/************************/
proc print;
format x1-x11 5.;
title '5.';
run;
/************************/
proc print;
format x1-x11 3.;
title '3.';
run;
/************************/
proc print;
format x1-x11 2.;
title '2.';
run;
/************************/
proc print;
format x1-x11 1.;
title '1.';
run;
/************************/
proc print;
format x1-x11 10.0;
title '10.0';
run;
/************************/
proc print;
format x1-x11 10.2;
title '10.2';
run;
/************************/
proc print;
format x1-x11 10.3;
title '10.3';
run;
/************************/
proc print;
format x1-x11 10.4;
title '10.4';
run;
/************************/
proc print;
format x1-x11 10.9;
title '10.9';
run;
/************************/
proc print;
format x1-x11 z10.4;
title 'z10.4';
run;
/************************/
quit;


