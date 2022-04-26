function [rex rey]=uc_integral_genexample()

[data mas whatclass classmas F J]=uc_integral_generatewave_main();

rex=horzcat(F,J)';
cl=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
rey=cl(whatclass,:)';