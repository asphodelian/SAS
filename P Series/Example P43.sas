/*******************************************************************/
data fire;
infile '\\Client\D$\M338 SAS\Data Files\Fire Damage.txt';
input distance damage insur $;
*label distance = 'Distance from fire Station in miles'
      damage   = 'Fire damage in thousands of dollars'
      insur    = 'Insured';
*d2 = distance * distance;
*d3 = d2 * distance;
*if insur = 'YES' then insurecat = 1;
*	else insurecat = 0;
*distcat = distance * catin;
run;
/*********************************************************/
proc print;
run;
/**********************************************************
proc gplot;
plot damage*distance;
*plot damage*distance=insur;
run;
/*******************************************************/
proc corr;
var damage distance;
run;
/**********************************************************/
proc reg ;
*where insur = "YES";
model damage = distance;
*model damage = distance insurecat;
*var damage distance;
*model damage = distance d2 d3;
*var damage distance d2 d3;
*model damage = distance / clb cli clm;
*model damage = distance / r;
*model damage = distance / clb cli clm r;
plot damage*distance;
*plot damage*distance / pred conf;
*plot r.*distance;
run;
/*********************************************************
proc gplot;
symbol1 interpol=rcclm95;
plot damage*distance / regeqn;
run;
/*********************************************************/
quit;
