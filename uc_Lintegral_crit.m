function [re res V W]=uc_Lintegral_crit(data,mas,W,Umin)

if ~exist('nof_intervals') nof_intervals=10; end

ind=zeros(1,(length(data)-1)/2);
isum=0;
iind=1;
for i=1:length(data)
    if iscell(data{i})
        ind(iind)=isum;
        E(iind)=data{i}{2}^2;
        isum=isum+length(data{i}{1});
        iind=iind+1;
    else
        isum=isum+single(data{i});
    end
end

%ind(iind)=ind(iind+1);
P=ind;
Pp1=P(2:end);
Ps=P(1:end-1);

V=sqrt(  (1+(Pp1-Ps)./Pp1).^4-1  );

W=autodiv(E);

tosmall=0.8;

c1=W<V.*tosmall;
c4=W>2*V;
c3_b=W>V;
c2=(~c1)&(~c3_b);
c3=c3_b&(~c4);

res(find(c1))=1;
res(find(c2))=2;
res(find(c3))=3;
res(find(c4))=4;
%res
cl=[1 2 3 4];
for i=length(cl):-1:1
    perc(i)=sum(res==cl(i));
end
re=find(perc==max(perc));
re=re(1);

%W
%V


function re=autodiv(N)
Nk=N(1:length(N)-1);

Np1=N(2:length(N));

Find1=find(Nk~=0);
Find2=find(Nk==0);
re(Find1)= Np1(Find1)./Nk(Find1);
re(Find2)=(Np1(Find2)~=0);