function UDPcall_OpeningFcn(hObject, eventdata, handles, varargin)  
handles.output = hObject;  
%�������ݶ˵Ĳ�������  
ipMAT='127.0.0.1'; %�������ݶ˵�ip�Ͷ˿ںţ����ص�  
portMAT=20000;   
ipVS='127.0.0.1'; %�������ݶ˵�ip�Ͷ˿ںţ�Զ�˵�  
portVS=30000;  
set(handles.localIP,'string',num2str(ipMAT));  
set(handles.remoteIP,'string',num2str(ipVS));  
set(handles.remotePort,'string',num2str(portVS));  
set(handles.localPort,'string',num2str(portMAT));  
set(handles.receive_edit1,'string',' ');  
global count num1 abnorm;  
handles.udpTransmit=udp(ipVS,portVS,'LocalPort',portMAT);%MAT���͸�VS  
fopen(handles.udpTransmit);%��udp  
handles.udpTransmit.ReadAsyncMode = 'continuous';%�첽ͨ��ʱ����������������  
set(handles.udpTransmit,'DatagramTerminateMode','on');  
handles.udpTransmit.DatagramReceivedFcn={@updateUDP,handles};  
guidata(hObject, handles); 