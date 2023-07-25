options nodate nonumber linesize=70;
/*******************************************
data temp;
input sex $1 ss 2-10 @;
if sex = 'm' then input eyecol $ w;
if sex = 'f' then input w eyecol $;
*label eyecol= 'Eye Color'
      w = 'Weight'
      ss = 'Social Security Number'
      sex = 'Gender';
datalines;
f348578798 135 Blue
m982359877 Green 154
;
proc print label noobs;
format ss ssn.;
run;
/******************************************
data temp1;
input code $ @;
if code = 'n' then do;
	                input name $CHAR25. ;
                    output;
                   end;
else if code = 'a' then do;
	                     input address $CHAR30.;
                         output;
                        end;
else if code = 'c' then do;
	                     input comment $CHAR30.;
                         output;
                        end;
drop code;
datalines;
n Ann Lincoln
a 101 S. Main St.
a Anytown, USA
c good prospect
c called 01May81
n Mary Scott
a 1 Castle Street
a Scotland
n John B. Smile
a P.O.Box 490
c personal visit 01May82
;
proc print;
run;

/**********************************************/
data temp2;
*file 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\data\April26dat.txt';
input sex $ code $ @;
do j = 1 to 4;
	input x1 x2 @;
	*put sex 1 code 3 x1 5-6 x2 8-9; 
	output;
	drop j;
end;
datalines;
m a 5 6 5 4 9 9 7 6
m b 7 6 7 7 9 12 6 8
m c 21 15 14 11 17 12 12 10
f a 7 10 6 6 9 7 8 10 
f b 10 13 8 7 7 6 6 9
f c 16 12 14 9 14 8 10 5
;
/*************************************************/
proc print;
run;
