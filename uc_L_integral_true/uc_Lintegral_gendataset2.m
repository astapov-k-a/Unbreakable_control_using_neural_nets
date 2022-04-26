function [rex rey]=uc_Lintegral_gendataset(ssize)

if ~exist('ssize') ssize=10000; end

for i=ssize:-1:1
    [rex(:,i),rey(:,i)]=uc_Lintegral_genexample();
end