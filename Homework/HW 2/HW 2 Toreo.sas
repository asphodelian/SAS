data temp;
call streaminit(0);
do i = 1 to 961;
    do j = 1 to 625;
        x=rand('BETA',0.5,0.5);
    output;
    end;
    end;
run;

proc means data = temp;
by i;
var x;
output out=OutStats3 mean=SampleMean std=SampleStd;
run;
