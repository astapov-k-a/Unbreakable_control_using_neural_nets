function [rex rey]=uc_Lintegral_gendataset(ssize)

if ~exist('ssize') ssize=10000; end
ssize=min(10000,ssize);

% tx(38,10000)=0;
% ty(1,10000)=0;
tx=[];
ty=[];
tx=load('in_dataset');
ty=load('out_dataset');
tx=tx.xset;
ty=ty.yset;

rex=tx(:,1:ssize);
rey=ty(:,1:ssize);

size(rex)
size(rey)