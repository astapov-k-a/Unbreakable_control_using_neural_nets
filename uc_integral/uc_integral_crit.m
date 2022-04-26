function [re res F J]=uc_integral_crit(data,mas,W,Umin)

if ~exist('nof_intervals') nof_intervals=10; end

Asum=0;
numsum=0;
for i=1:length(data)
    if iscell(data{i})
        if data{i}{2}>Umin
            Asum=Asum+data{i}{2};
            numsum=numsum+1;
        end
    end
end

ind=zeros(1,(length(data)-1)/2);
isum=0;
iind=1;
for i=1:length(data)
    if iscell(data{i})
        ind(iind)=isum;
        isum=isum+length(data{i}{1});
        iind=iind+1;
    else
        isum=isum+single(data{i});
    end
end
%ind(iind)=ind(iind+1);
itr=1:floor(length(mas)/(nof_intervals-0)):length(mas);

% ind
%length(itr)-1
for i=1:length(itr)-1
%     ind
%     (ind>=itr(i))&(ind<=itr(i+1))
    pikes=find((ind>=itr(i))&(ind<=itr(i+1)));
    
    N(i)=0;    
    a=0;c=0;
    for j=1:length(pikes)
%        pikes(j)*2,length(data)
%        pikes
        if data{pikes(j)*2}{2}>Umin
            a=a+data{pikes(j)*2}{2};
            c=c+1;
            N(i)=N(i)+1;
        end
    end
    A(i)=0;
    if (c~=0) A(i)=a/c; end
end

sA=sum(A);
sA(find(sA==0))=1;
%A
J=A./sA./W;
%N
%itr
Nk=N(1:length(N)-1);
%Nnz2(find(Nnz==0))=1;
%Nnz2(find(Nnz~=0))=1./Nnz2(find(Nnz~=0));
%Nnz
%Nnz2
%Nk
Np1=N(2:length(N));

Find1=find(Nk~=0);
Find2=find(Nk==0);
Ft(Find1)= Np1(Find1)./Nk(Find1);
Ft(Find2)=(Np1(Find2)~=0);
%sum(Ft)
%nof_intervals
F=sum(Ft)./nof_intervals;
%F=sum(N(2:length(N)).*Nnz2);

tabl=[1 2 3;2 2 3;3 3 4];

dim1=sign(F-1)+2;
dim2=ones(size(J)).*2;
dim2(find(J<1))=1;
dim2(find(J>2))=3;
dim2;
res=tabl(dim1,dim2);


cl=[1 2 3 4];
%res
for i=length(cl):-1:1
    perc(i)=sum(res==cl(i));
end
re=find(perc==max(perc));
re=re(1);