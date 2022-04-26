function [xset yset]=uc_Lintegral_gen4


xsamplesize=4*2;

nel=4;
clear xset;
clear yset;
%xset(xsamplesize,nel)=0;
%yset(4,nel)=0;
xset=zeros(xsamplesize,nel);
yset=zeros(4,nel);


norm=nel/4;

count=zeros(1,4);
found=0;
Ofl=[1 1 1 1];

ii=0;


while sum(count)<nel    
    [data lb mas]=generate_wave(3,5,4,5,1000,0.1,-1); %I 71.69%; II 2.04%; III 4.77%; IV 13.5
    [st, mas, V, W]=uc_Lintegral_crit(data,mas,0.1,0.1);
    ii=ii+1;
    if mod(ii,1000000)==0
        count
        pause
    end
    if (count(st)<norm)
        count(st)=count(st)+1;
         found=found+1;
         s(found)=st;
        rex2=horzcat(V,W)';
        rex=zeros(xsamplesize,1);
        rex(1:size(rex2))=rex2;
        cl=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
        rey=cl(st,:)';
        ind=st+(count(st)-1)*4;
        xset(:,ind)=rex;
        yset(:,ind)=rey;
    else
        if Ofl(st)==0
            fprintf('overflow!!! %1.0f\n\n',st);
            Ofl(st)=1;
        end
    end
end


