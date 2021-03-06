%uc_int_test

clear all;
nel=1000;

for a=nel:-1:3*nel/4
    [data lb mas]=generate_wave(3,5,4,5,1000,0.9,1);
    s(a)=uc_integral_crit(data,mas,0.05,0.1);
end

for a=floor(3*nel/4):-1:nel/2
    %[data lb mas]=generate_wave(3,5,4,5,1000,0.9,1);
    %s(a)=uc_integral_crit(data,mas,0.05,0.1);
    [data lb mas]=generate_wave2(13,14,4,5,1000,0.9,1); %I 3.7%; II 92.2%; III 4.1%
     [s(a), mas, F, J]=uc_integral_crit(data,mas,0.1,0.1);
end

for a=floor(nel/2):-1:1
    [data lb mas]=generate_wave2(19,20,4,5,1000,0.9,1);
    s(a)=uc_integral_crit(data,mas,0.05,0.1);
end

% for a=nel:-1:1
%     
%     %[data lb mas]=generate_wave2(19,30,4,5,1000,0.9,-1); %I 78%; II 18%
%     %[data lb mas]=generate_wave(18,20,4,5,1000,0.9,1); %II 48%; III 52%
%     %[data lb mas]=generate_wave2(4,5,4,5,1000,0.9,-1); %I 100%;
%     %[data lb mas]=generate_wave2(10,15,4,5,1000,0.9,1); %I 18%; II 82%
%     %[data lb mas]=generate_wave2(14,14,4,5,1000,0.9,1); %I 3.7%; II 92.2%; III 4.1%
%      %[data lb mas]=generate_wave2(19,20,4,5,1000,0.9,1);%II 47.2%; III 52.9%
%     %[s(a), mas, F, J]=uc_integral_crit(data,mas,0.1,0.1);
%     %----------------------------------------------------
%     %[data lb mas]=generate_wave2(19,20,4,5,1000,0.9,1);%III 47.7%; IV 52.3%
%     %[s(a), mas, F, J]=uc_integral_crit(data,mas,0.05,0.1);
%     %----------------------------------------------------
%     [data lb mas]=generate_wave2(14,14,4,5,1000,0.9,1); %I 3.7%; II 92.2%; III 4.1%
%     [s(a), mas, F, J]=uc_integral_crit(data,mas,0.1,0.1);
%     %s(a)=uc_integral_crit(data,mas,0.05,0.1);
% end

fprintf('????? 1:%3.2f\n',sum(s==1)/nel*100);
fprintf('????? 2:%3.2f\n',sum(s==2)/nel*100);
fprintf('????? 3:%3.2f\n',sum(s==3)/nel*100);
fprintf('????? 4:%3.2f\n',sum(s==4)/nel*100);

F
J
