function u = udpReceiveOpen(port2receive)

global udpReceive
global errCount
errCount = 0;
%�������ݶ˵Ĳ�������
portReceive_Local=port2receive; %�������ݶ˵Ķ˿ںţ����ص�
ipTransmit_Remote='192.168.1.57'; %�������ݶ˵�ip�Ͷ˿ںţ�Զ�˵�
portTransmit_Remote = port2receive;
udpReceive=udp(ipTransmit_Remote,portTransmit_Remote,'LocalPort',portReceive_Local);

% udpReceive.BytesAvailableFcnMode='byte';
% udpReceive.BytesAvailableFcnCount = 4; 
% udpReceive.BytesAvailableFcn = @updateUDP; 



udpReceive.DatagramReceivedFcn=@updateUDP;
udpReceive.DatagramTerminateMode = 'on';

set(udpReceive,'InputBufferSize',4096*32);

% udpReceive.DatagramReceivedFcn = @instrcallback;%��ʾudp������Զ��ip������ʱ�䡣

fopen(udpReceive);

u = udpReceive;
