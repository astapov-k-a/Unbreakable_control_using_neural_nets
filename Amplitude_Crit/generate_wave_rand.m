function [re lastblank]=generate_wave_rand(min_waves,max_waves,minwlength,maxwlength,interval)

numw=rand(1,1).*(max_waves-min_waves)+min_waves;

%%m(1,x) - длина промежутка ДО нового всплеска, m(2,x) - длина всплеска (промежуток между последним всплеском и концом высчитывается)
m(2,:)=(rand(1,numw).*(maxwlength-minwlength+1))+minwlength; %длины волн
m=floor(m);

lastblank=rand(1,1);
ostat=interval-sum(m(2,:));
m(1,:)=rand(1,numw);
koef=(  sum(m(1,:))+lastblank  )./ostat;
m(1,:)=m(1,:)./koef;
m(1,:)=floor(m(1,:)+0.5);
lastblank=interval-sum(sum(m));
%m=rand(2,numw); 
%m=m./(lastblank+sum(sum(m))+minwaves*numw/interval);
%m=uint64(m.*interval);
%m(2,:)=m(2,:).+minwaves;
m=uint64(m);
%re=m
for (i=1:numw)
    re{(i-1)*2}=m(1,i};
    re((i-1)*2+1)={sinpai{m(2,i)}};
end
re{numw+1}=lastblank;