function re=uc_dat2mas(data)

for i=1:length(data)
    if iscell(data{i})
        if (i~=1) re=horzcat(re,data{1,i}{1}{1,:}); else re=data{1,i}{1}{1,:}; end
    else
        if (i~=1) re=horzcat(re,zeros(1,data{i})); else re=zeros(1,data{i}); end
    end
end