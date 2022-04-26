function [data mas whatclass classmas V W]=uc_Lintegral_generatewave_main(minwlength,maxwlength,interval)

if ~exist('minwlength') minwlength=4; end
if ~exist('maxwlength') maxwlength=5; end
if ~exist('interval') interval=1000; end

sel=rand(1,1);

if sel<=0.25
    [data lb mas]=generate_wave(3,5,minwlength,maxwlength,interval,0.9,1);
    [whatclass, classmas, V, W]=uc_Lintegral_crit(data,mas,0.05,0.1);
end
if (sel>0.25)&&(sel<=0.5);
    [data lb mas]=generate_wave2(13,14,minwlength,maxwlength,interval,0.9,1); %I 3.7%; II 92.2%; III 4.1%
    [whatclass, classmas, V, W]=uc_Lintegral_crit(data,mas,0.1,0.1);
end

if sel>0.5
    [data lb mas]=generate_wave2(19,20,minwlength,maxwlength,interval,0.9,1);
    [whatclass, classmas, V, W]=uc_Lintegral_crit(data,mas,0.05,0.1);
end