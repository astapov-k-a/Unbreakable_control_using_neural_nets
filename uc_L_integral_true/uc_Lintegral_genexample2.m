function [rex rey]=uc_Lintegral_genexample()

xsamplesize=19*2;

[data mas whatclass classmas V W]=uc_Lintegral_generatewave_main();

rex2=horzcat(V,W)';
rex=zeros(xsamplesize,1);
rex(1:size(rex2))=rex2;
cl=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
rey=cl(whatclass,:)';
% 
% disp {---
% size(rey)
% size(rex)
% disp ---}