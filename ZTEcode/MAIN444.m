DATA111;%���������ŵ���Ϣ   250*7 һ�������ŵ�ֵ  ��6�к͵�7�м�������   ǰ�����������


H_orign=H0(:,5);

h=zeros(250,1);%����ֵ
Phi=dftmtx(250);%ϡ�����
h_orign=(1./Phi)*H_orign;
h_real=(1./Phi)*H0(:,5);
%���ɲ�������
L=1:10:250;
N=length(L);%��Ƶ����
LL=sort(L);
LLL=LL'-125;
P=zeros(N,250);
for i=1:N
    P(i,LL(i))=1;
end

y=P*H_orign;%�۲���
A=P*Phi;%���о���
B=A(:,1:25);
hhh=inv(B'*B)*B'*y;
hhh2=(1./dftmtx(N))*y;
%%
%ϡ�����֪�㷨
% knownS;
h(1:25)=CS_SP_v1(y,B,5);
%  h(1:25)=DAMP(y,30,25,1,'BM3D',B);%����ʧ��
He=Phi*h;
NMSE=10*log10(sum(abs(He-H0(:,5)).^2)/sum(abs(H0(:,5)).^2));
E=(sum(abs(He-H0(:,7)).^2)/sum(abs(H0(:,7)).^2))+N/250;
fprintf('NMSE=%.2f~dB,~ E=%d',NMSE,E);
%ϡ�������Ӧ�㷨
% UNknownS;
%%
%��ͼ
figure;
plot(abs(H0(:,5)));
hold on;plot(abs(He));
legend('ԭʼֵ','����۲�Ĺ���ֵ');
grid on;
figure;
plot(abs(h_real)/250,'bo');
hold on;plot(1:250,abs(h_orign)/250,'k*');
hold on;plot(abs(h),'r>');grid on;
hold on;plot(abs(hhh),'gx');
hold on;plot(abs(hhh2)/N,'rs');
legend('��ʵ�ŵ�','ԭʼ�����ŵ�','����۲�Ĺ���ֵ','LS','ifft�Թ۲���');
