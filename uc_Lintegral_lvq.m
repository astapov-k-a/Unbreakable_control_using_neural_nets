%uc_amplitude

sz=2500;

[tx, ty]=uc_Lintegral_gendataset(sz);
limm=zeros(size(tx,1),2);
limm(:,2)=1;
%net=newff(limm,[size(tx,2)  4]);
net=newlvq(limm,size(tx,2),[0.25 0.25 0.25 0.25]);


sz=300;

% net.trainFcn='trainbfg'
net.trainParam.show=1;
net.trainParam.epochs=50;
net.trainParam.goal=0.025;
net=train(net,tx,ty);

%проверка
fprintf('\n\n\n\nПроверка ИНС на незнакомых ей образцах\n\n');
for i=1:5
    [rex, rey]=uc_Lintegral_genexample();
    %rex
    nety=max(0,sim(net,rex));
    %rey,nety
    
    fprintf('Случайный образец N°%u, ожидается значения %2.2f %2.2f %2.2f %2.2f (класс %u),\nзначение нейронной сети %2.2f %2.2f %2.2f %2.2f \n Нейронная сеть отнесла образец к классу %u\n\n\n',i,rey(1)*100,rey(2)*100,rey(3)*100,rey(4)*100,uint8(find(rey==max(rey))),nety(1)*100,nety(2)*100,nety(3)*100,nety(4)*100,uint8(find(nety==max(nety))));
end