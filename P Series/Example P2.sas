/*   a) What percent of all Alaska Airlines flights were delayed?
     b) What perecnt of all America West flights were delayed?
     c) Find the percent of delayed flights for Alaska Airlines at each of the five airports.
     d) Find the percent of delayed flights for America West at each of the five airports. 
*/
data air;  
input airline $ 
      city $ 
      arrival $ 
      count;
datalines;
alaska la ontime 497
alaska phoenix ontime 221
alaska sandiego ontime 212
alaska sanfran ontime 503
alaska seattle ontime 1841
alaska la delayed 62
alaska phoenix delayed 12
alaska sandiego delayed 20
alaska sanfran delayed 102
alaska seattle delayed 305
amwest la ontime 694
amwest phoenix ontime 4840
amwest sandiego ontime 383
amwest sanfran ontime 320
amwest seattle ontime 201
amwest la delayed 117
amwest phoenix delayed 415
amwest sandiego delayed 65
amwest sanfran delayed 129
amwest seattle delayed 61
;
run;
/*********************************************************
proc print;
*title 'Second Program';
*footnote 'end of second program';
*by airline;
run;
/*********************************************************/
proc freq;
weight count;
*tables airline*arrival city*airline*arrival ;
*tables airline city arrival;
tables arrival*airline /nopercent norow ;
tables city*arrival*airline /nopercent norow ;
*tables airline*arrival /nopercent norow ;
*tables city*airline*arrival /nopercent norow  ;
run;
/*********************************************************
proc freq;
weight count;
where city='la';
tables airline*arrival;
title 'la';
run;
/**********************************************************
proc tabulate format=8.0;
freq count;
class airline city arrival;
var count;
table arrival*colpctn*f=5.1, airline*city;
run;
/*********************************************************
quit;
