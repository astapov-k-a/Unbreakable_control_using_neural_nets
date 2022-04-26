function [rex rey]=uc_Lintegral_genexample()

[x y]=uc_Lintegral_gen4;

cl=floor(rand(1,1)*4)+1;

rex=x(:,cl);
rey=y(:,cl);