%uc_amplitude

sz=100;

[tx, ty]=uc_Lintegral_gendataset(sz);
limm=zeros(size(tx,1),2);
limm(:,2)=1;
net=newff(limm,[size(tx,2)  4]);
%net=newlvq(limm,size(tx,2)*50,[0.25 0.25 0.25 0.25]);

net.trainFcn='trainbfg'
net.trainParam.show=1;
net.trainParam.epochs=300;
net.trainParam.goal=0.025;
net=train(net,tx,ty);


sz=300;

[tx, ty]=uc_Lintegral_gendataset(sz);


net.trainParam.epochs=100;
net=train(net,tx,ty);

%��������
fprintf('\n\n\n\n�������� ��� �� ���������� �� ��������\n\n');
for i=1:5
    [rex, rey]=uc_Lintegral_genexample();
    %rex
    nety=max(0,sim(net,rex));
    %rey,nety
    
    fprintf('��������� ������� N�%u, ��������� �������� %2.2f %2.2f %2.2f %2.2f (����� %u),\n�������� ��������� ���� %2.2f %2.2f %2.2f %2.2f \n ��������� ���� ������� ������� � ������ %u\n\n\n',i,rey(1)*100,rey(2)*100,rey(3)*100,rey(4)*100,uint8(find(rey==max(rey))),nety(1)*100,nety(2)*100,nety(3)*100,nety(4)*100,uint8(find(nety==max(nety))));
end