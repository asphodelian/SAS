/* Here we have to generate 625 samples of size 961 from U(1,9)/

/ Here a = 1 and b = 9 /

%let ns = 961; / sample size /

%let n = 625; / Number of samples*/

%let a =1;

%let b= 9;
/***********************************/
data a(keep =s1-s&n) ;

array s{&n};

do j = 1 to &ns;

      do i = 1 to &n;

            u=rand("uniform");            *Sample from uniform;

            x = &a+ (&b-&a)u;

            s{i} = x;

      end;

output;

end;

run;
/***********************************/
/* Calculating mean for each sample s1 to s625*/

proc means data = a mean ;

      var s1-s&n;

      output out = b;(drop = :);

run;
/***********************************/
* a);

data c(keep = prob );

      set b(firstobs=4 obs = 4);

      array s{&n};

      cnt=0;

      do i = 1 to &n;

      if s{i} > 5 and s{i}<5.2 then cnt = cnt+1;

      end;

      prob = cnt/&n;

run;
/***********************************/
/*Mean of means and standard deviation*/

*b,c);

proc transpose data =b(drop = : firstobs = 4 obs=4) out = d;

run;
/***********************************/
proc means data = d mean std;

      output out = e;

run;
/***********************************/
/*d*/
proc univariate data = d;

histogram col1;

run;
/***********************************/
title 'HW 2: chegg vers'
run;
quit;
