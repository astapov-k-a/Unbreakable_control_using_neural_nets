%uc_Lint_test


xsamplesize=4;

nel=10000;
clear xset;
clear yset;
%xset(xsamplesize,nel)=0;
%yset(4,nel)=0;
xset=zeros(xsamplesize,nel);
yset=zeros(4,nel);


norm=nel/4;

count=zeros(1,4);
found=0;
Ofl=[0 0 0 0];

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
        %rex2=horzcat(V,W)';
        rex2=mas';
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



% for a=nel:-1:1
%     
%     [data lb mas]=generate_wave2(13,15,4,5,1000,0.1,-1,-1); %I 57.61%; II 0.03%; III 1.59%; IV 40.77
%     %[data lb mas]=generate_wave(13,15,4,5,1000,0.1,-1); %I 57.61%; II 0.03%; III 1.59%; IV 40.77
%     %[data lb mas]=generate_wave(3,5,4,5,1000,0.1,-1); %I 71.69%; II 2.04%; III 4.77%; IV 13.5
%     %[data lb mas]=generate_wave2(13,14,4,5,1000,0.1,1); %I 24.15%; II 0.06%; III 4.04%; IV 71.75
%     %[data lb mas]=generate_wave2(19,20,4,5,1000,0.1,1); %I 5.36; III 1.2%; IV 93.44
%     [s(a), mas, V, W]=uc_Lintegral_crit(data,mas,0.1,0.1);
% end

fprintf('класс 1:%3.2f\n',sum(s==1)/nel*100);
fprintf('класс 2:%3.2f\n',sum(s==2)/nel*100);
fprintf('класс 3:%3.2f\n',sum(s==3)/nel*100);
fprintf('класс 4:%3.2f\n',sum(s==4)/nel*100);

V
W
mas
