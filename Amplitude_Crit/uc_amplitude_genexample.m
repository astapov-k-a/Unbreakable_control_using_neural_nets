function [rex rey]=uc_amplitude_genexample(At,Umin)

%function [re lastblank re2]=generate_wave(min_waves,max_waves,minwlength,maxwlength,interval,minpikes,maxpikes)
[data lb mas]=generate_wave(1,10,4,10,140,0,1);

%[re Aav]=uc_amplitude_crit(data,mas,At,Umin)
[yind A]=uc_amplitude_crit(data,mas,At,Umin);

ymas=[0 0 0 1;0 0 1 0;0 1 0 0; 1 0 0 0];
rey=ymas(yind,:)';

%A,At

rex=[A At abs(A-At) (A-At) yind/4];