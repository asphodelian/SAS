*options nodate pageno=1 nocenter linesize = 100;
*goptions device=gif
	hsize=4in vsize=3in
	border
	ftext=?Helvetica? htext=12pt
	hpos=40;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*********************************************/
proc print label data = datain.newstate;
run;
/*********************************************
*pattern color=purple;
proc gchart data = datain.newstate;
*vbar visits;
*vbar visits / discrete space=0;
*vbar visits / discrete space=0 width=20;
*vbar visits / space=0 midpoints = 1 to 5 by 0.5;
*vbar visits / discrete space=0 type = percent;
*vbar visits / discrete space=0 type = cpct; /*cumulative percentage*/
*block visits / discrete;
*vbar region;
*vbar region / subgroup = visits ;
*vbar region / group = visits ;
*vbar region / sumvar = expenses type=mean;
*vbar region / sumvar = expenses ;
*vbar sale / space=0;
*vbar sale / space = 0 midpoints = 75000 to 2000000 by 75000;
*vbar sale /  space=0 midpoints = 10000 to 200000 by 5000 ;
*block region / group = visits sumvar = sale type = mean;
*pie region;
/*pie chart should be used for the whole pop*/
/*imagine you're taking sample of hair colors. Only really bar graph, because it only covers PART of the pop*/
*pie visits / discrete;
*star region;
*donut region;
run;
/*******************************************************
proc gchart data = datain.newstate;
*vbar3d visits ;
vbar3d visits /discrete space = 0;
*vbar3d visits /discrete space = 0 shape = block;
*vbar3d visits / midpoints = 1 2 3 4 5;
*vbar3d region ;
*block region ;
*vbar3d visits / discrete space=0 type = pct;
*vbar3d visits / discrete space=0 type = cpct;
vbar3d visits / discrete space=0 group = region;
vbar3d visits / discrete space=0 subgroup = region;
*vbar3d region / group = visits ;
*vbar3d region / sumvar = sale type = sum ;
*vbar3d region / sumvar = sale type = mean ;
*vbar3d region / sumvar = expenses type = sum ;
*vbar3d sale / space = 0;
*vbar3d sale / space = 0 levels=10 range;
*block visits / discrete group = region sumvar = sale type = mean;
pie3d region;
run;

/***************************************************/
proc freq data = datain.newstate;
*table region;
*table visits / nocum;
*tables region visits salesman;
tables region visits salesman / nopercent;
*tables region*visits;
*tables visits*region ;
tables visits*region*salesman ;
*tables region*salesman / norow ;
*tables visits*region / norow nocol nopercent;
*tables visits*region / norow nocol nopercent no freq;
*tables visits region visits*region ;
run;
/***************************************************/

quit;
