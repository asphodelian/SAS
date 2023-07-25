/***********************************/
data a;
meanx=0;
do j=1 to 225;
sumx=0;
do i = 1 to 625;
u=rand ("Uniform");
x=10+(22-10)*u;
sumx=sumx+x;
end;
meanx=sumx/625;
output;
end;
run;
/***********************************/
proc freq;
tables meanx;
run;
/***********************************/
proc univariate;
var meanx;
histogram meanx;
run;
/***********************************/
title 'Testing';
run;
end;
