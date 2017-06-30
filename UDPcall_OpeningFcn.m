function UDPcall_OpeningFcn(hObject, eventdata, handles, varargin)  
handles.output = hObject;  
%发送数据端的参数设置  
ipMAT='127.0.0.1'; %本地数据端的ip和端口号，本地的  
portMAT=20000;   
ipVS='127.0.0.1'; %接收数据端的ip和端口号，远端的  
portVS=30000;  
set(handles.localIP,'string',num2str(ipMAT));  
set(handles.remoteIP,'string',num2str(ipVS));  
set(handles.remotePort,'string',num2str(portVS));  
set(handles.localPort,'string',num2str(portMAT));  
set(handles.receive_edit1,'string',' ');  
global count num1 abnorm;  
handles.udpTransmit=udp(ipVS,portVS,'LocalPort',portMAT);%MAT发送给VS  
fopen(handles.udpTransmit);%打开udp  
handles.udpTransmit.ReadAsyncMode = 'continuous';%异步通信时，连续读串口数据  
set(handles.udpTransmit,'DatagramTerminateMode','on');  
handles.udpTransmit.DatagramReceivedFcn={@updateUDP,handles};  
guidata(hObject, handles); 