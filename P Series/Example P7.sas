libname dataout '\\Client\D$\M338 SAS\Data Files';
/*********************************************************/
*proc contents data = 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\statedata';
proc contents data = dataout.statedat;
run;
/*********************************************************/
*proc print label data = 'C:\Users\mrkafai\Dropbox\ClassesSpring2021\Math338\Data\statedat';
proc print label data = dataout.statedat;
run;
/*********************************************************/

quit;
