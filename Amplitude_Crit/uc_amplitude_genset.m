function [rex rey]=uc_amplitude_genset(size,At,Umin)

for i=1:size
    [drex, drey]=uc_amplitude_genexample(At,Umin);
    rex(:,i)=drex;
    rey(:,i)=drey;
end