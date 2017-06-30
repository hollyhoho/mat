function u = udpReceiveOpen(port2receive)

global udpReceive
global errCount
errCount = 0;
%接收数据端的参数设置
portReceive_Local=port2receive; %接收数据端的端口号，本地的
ipTransmit_Remote='192.168.1.57'; %发送数据端的ip和端口号，远端的
portTransmit_Remote = port2receive;
udpReceive=udp(ipTransmit_Remote,portTransmit_Remote,'LocalPort',portReceive_Local);

% udpReceive.BytesAvailableFcnMode='byte';
% udpReceive.BytesAvailableFcnCount = 4; 
% udpReceive.BytesAvailableFcn = @updateUDP; 



udpReceive.DatagramReceivedFcn=@updateUDP;
udpReceive.DatagramTerminateMode = 'on';

set(udpReceive,'InputBufferSize',4096*32);

% udpReceive.DatagramReceivedFcn = @instrcallback;%显示udp参数，远端ip，接收时间。

fopen(udpReceive);

u = udpReceive;
