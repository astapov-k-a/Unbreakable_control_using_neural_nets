%uc_amplitude

At=0.3;
Umin=0.1;

[tx, ty]=uc_amplitude_genset(10000,At,Umin);
limm=zeros(size(tx,1),2);
limm(:,2)=1;
%net=newff(limm,[size(tx,2)  1]);
net=newff(limm,[8  4],{'tansig' 'logsig'});

net.trainFcn='trainbfg'
net.trainParam.show=1;
net.trainParam.goal=0.007;
net=train(net,tx,ty);

%��������
fprintf('\n\n\n\n�������� ��� �� ���������� �� ��������\n\n');
for i=1:5
    [rex, rey]=uc_amplitude_genexample(At,Umin);
    %rex
    nety=sim(net,rex');
    %rey,nety
    
    fprintf('��������� ������� N�%u, ��������� �������� %2.2f %2.2f %2.2f %2.2f (����� %u),\n�������� ��������� ���� %2.2f %2.2f %2.2f %2.2f \n ��������� ���� ������� ������� � ������ %u\n\n\n',i,rey(1)*100,rey(2)*100,rey(3)*100,rey(4)*100,uint8(find(rey==max(rey))),nety(1)*100,nety(2)*100,nety(3)*100,nety(4)*100,uint8(find(nety==max(nety))));
end