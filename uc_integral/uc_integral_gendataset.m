function [rex rey]=uc_integral_gendataset(ssize)

if ~exist('ssize') ssize=10000; end

for i=ssize:-1:1
    [rex(:,i),rey(:,i)]=uc_integral_genexample();
end