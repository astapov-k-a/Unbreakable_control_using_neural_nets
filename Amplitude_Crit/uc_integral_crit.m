function [re F J]=uc_integral_crit(data,mas,W,Umin)

if ~exist('nof_intervals') nof_intervals=10; end

for i=1:length(data)
    if iscell(data{i})
        if data{i}{2}>Umin
            Asum=Asum+data{i}{2};
            numsum=numsum+1;
        end
    end
end

ind=zeros((length(data)-1)/2);
isum=0;
iind=0
for i=1:length(data)
    ind(iind)=isum;
    if iscell(data{i})
        isum=isum+length(data{i}{1});
        iind=iind+1;
    else
        isum=isum+data{i};
    end
end
%ind(iind)=ind(iind+1);
itr=1:floor(length(mas)/(nof_intervals-0)):length(mas);

for i=1:length(itr)
    pikes=find(ind>=itr(i)&(ind<=itr(i+1));
    
    N(i)=0;    
    a=0;c=0;
    for j=1:length(pikes)
        if data{pikes(j)*2}{2}>Umin
            a=a+data{pikes(j)*2}{2};
            c=c+1;
            N(i)=N(i)+1;
        end
    end
    A(i)=a/c;
end

sA=sum(A);
J(:)=A./sA./W;
F=sum(N(2:length(itr)./N(1:length(itr)-1)./nof_intervals;

tabl=[1 2 3;2 2 3;3 3 4];

dim1=sign(F-1)+2;
dim2=ones(size(J)).*2;
res=tabl(dim1,dim2);


cl=[1 2 3 4];
for i=length(cl):-1:1
    perc(i)=sum(res==cl[i]);
end
re=find(perc==max(perc));