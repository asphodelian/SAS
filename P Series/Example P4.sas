data temp;

do  i = 1 to 10;
	x = ranuni(0);
	y = rannor (0);

	output;
end;

label x = 'Uniform random numbers';
label y = 'Normal random numbers';
run;
/****************************************/
proc print data=temp label noobs;
*proc print label noobs;
run;
/****************************************
proc gchart data=temp;
vbar x /space=0;
vbar y /space=0;
run;
