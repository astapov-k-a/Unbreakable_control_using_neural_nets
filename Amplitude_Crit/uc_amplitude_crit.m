function [re Aav]=uc_amplitude_crit(data,mas,At,Umin)

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

if numsum<3
    re=1;
    if (numsum==0) Aav=0; else Aav=Asum/numsum; end
else
    Aav=Asum/numsum;
    if Aav<At 
        re=2;re=2; 
    end
    if Aav>=At
        if numsum>3
            re=4;
        else
            re=3;
        end
    end
end