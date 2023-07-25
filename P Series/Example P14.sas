options nodate ;
libname datain '\\Client\D$\M338 SAS\Data Files';
/*numeric denoted by ., alphanumeric denoted by empty space*/
data nh1;
set datain.nhanes2006 (keep = seqn riagendr ridreth1 lbxtc bmxbmi);
*if riagendr = 1 then output;
*if ridreth1 = 3 then delete;
*if (ridreth1 = 2 or ridreth1 = 5) then delete;
*if (lbxtc = . and bmxbmi = . ) then delete;
if (lbxtc = . or bmxbmi = . ) then delete;
*if not(lbxtc = . ) then delete;
*if (lbxtc = . ) then delete;
*if (bmxbmi = . ) then delete;
run;
/***************************************************/
proc contents data=nh1;
run;
/****************************************************
proc print label data = nh1 (obs = 50);
run;
/****************************************************/
/*categorical*/
proc freq data=nh1;
tables riagendr ridreth1 riagendr*ridreth1;
run;
/*****************************************************
proc freq data=nh1;
tables riagendr ridreth1 riagendr*ridreth1 /norow nocol;
tables riagendr ridreth1 riagendr*ridreth1;
run;
/***************************************************/
proc univariate data=nh1;
var lbxtc bmxbmi;
*histogram / normal;
run;
/***************************************************
proc gchart data=nh1;
vbar ridreth1 / discrete;
block  riagendr ridreth1 / discrete;
block  ridreth1 / discrete group= riagendr;
run;
/****************************************************
proc gchart data=nh1;
vbar ridreth1 / discrete sumvar=lbxtc type=mean;
vbar riagendr / discrete sumvar=lbxtc type=mean;
block riagendr / discrete group=ridreth1 sumvar=bmxbmi type=mean;
run;
/****************************************************/
proc gplot data=nh1;
where riagendr = 1;
plot lbxtc*bmxbmi;
*plot lbxtc*bmxbmi = riagendr;
run;
/*****************************************************/
quit;
