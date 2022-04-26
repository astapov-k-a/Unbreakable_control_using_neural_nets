function [re lastblank re2]=generate_wave(min_waves,max_waves,minwlength,maxwlength,interval,minpikes,maxpikes)

numw=floor(rand(1,1).*(max_waves-min_waves))+min_waves;

m=zeros(2,numw+1);
%%m(1,x) - длина промежутка ДО нового всплеска, m(2,x) - длина всплеска (промежуток между последним всплеском и концом высчитывается)
m(2,:)=(rand(1,numw+1).*(maxwlength-minwlength+1))+minwlength; %длины волн
m=floor(m);
m(2,numw+1)=0;

ostat=interval-sum(m(2,:));
m(1,:)=rand(1,numw+1);
koef=sum(m(1,:))./ostat;
m(1,:)=m(1,:)./koef;
m(1,:)=floor(m(1,:));
m(1,numw+1)=0;
lastblank=interval-sum(sum(m));
%m=rand(2,numw); 
%m=m./(lastblank+sum(sum(m))+minwaves*numw/interval);
%m=uint64(m.*interval);
%m(2,:)=m(2,:).+minwaves;
%sum(sum(m))
m=uint64(floor(m));
%pause
%re=m
for (i=1:numw)
    ampl=rand(1,1)*(maxpikes-minpikes)+minpikes;
    re{i*2-1}=m(1,i);    
    re{i*2  }{2}=ampl;
    re{i*2  }{1}={sinpai(m(2,i)).*ampl};
end
%numw+1
re{length(re)+1}=lastblank;


% for i=1:length(re)
%     if iscell(re{i})
%         if (i~=1) re2=horzcat(re2,re{1,i}{1}{1,:}); else re2=re{1,i}{1}{1,:}; end
%     else
%         if (i~=1) re2=horzcat(re2,zeros(1,re{i})); else re2=zeros(1,re{i}); end
%     end
% end
re2=uc_dat2mas(re);