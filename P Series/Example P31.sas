libname form '\\Client\D$\M338 SAS\Library';
options FMTSEARCH=(form);

proc format library=form fmtlib;
run;
