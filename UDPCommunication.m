function varargout = UDPCommunication(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UDPCommunication_OpeningFcn, ...
                   'gui_OutputFcn',  @UDPCommunication_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:}); 
end




function UDPCommunication_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
%=================================
%发送数据端的参数设置
ipLocal='192.168.1.118'; %本地数据端的ip，本地的
portTransmit_Local=1334; %发送数据端的端口号，本地的
ipReceive_Remote='192.168.1.118'; %接收数据端的ip和端口号，远端的
portReceive_Remote=7;
handles.udpTransmit=udp(ipReceive_Remote,portReceive_Remote,'LocalPort',portTransmit_Local);

%接收数据端的参数设置
portReceive_Local=1333; %接收数据端的端口号，本地的
ipTransmit_Remote='192.168.1.118'; %发送数据端的ip和端口号，远端的
portTransmit_Remote=1334;
handles.udpReceive=udp(ipTransmit_Remote,portTransmit_Remote,'LocalPort',portReceive_Local);

% handles.udpReceive.DatagramReceivedFcn = @instrcallback;%显示udp参数，远端ip，接收时间。

handles.udpReceive.BytesAvailableFcnMode='byte';
% handles.udpReceive.DatagramReceivedFcn='';
handles.udpReceive.BytesAvailableFcnCount = 4; 
handles.udpReceive.BytesAvailableFcn = @updateUDP; 

% handles.udpTransmit.ReadAsyncMode = 'continuous';%异步通信时，连续读串口数据  
% set(handles.udpTransmit,'DatagramTerminateMode','on');  
% handles.udpTransmit.DatagramReceivedFcn={@updateUDP,handles};  
%=================================
guidata(hObject, handles);


function varargout = UDPCommunication_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
%设置发送数据端缓存大小，打开发送数据端UDP
set(handles.udpTransmit,'OutputBufferSize',4096*4);
fopen(handles.udpTransmit);
%================================


function pushbutton2_Callback(hObject, eventdata, handles)
%发送数据
str=get(handles.edit1,'string');
fprintf(handles.udpTransmit,str);
%================================


function pushbutton3_Callback(hObject, eventdata, handles)
%关闭发送数据端UDP
fclose(handles.udpTransmit);
delete(handles.udpTransmit);
clear ipLocal portTransmit_Local ipReceive_Remote portReceive_Remote
%================================


function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function pushbutton4_Callback(hObject, eventdata, handles)
%设置接收数据端缓存大小，打开接收数据端UDP
set(handles.udpReceive,'InputBufferSize',4096*4);
fopen(handles.udpReceive);

guidata(hObject, handles); 
%=============================


function pushbutton5_Callback(hObject, eventdata, handles)
%接收数据
str=fscanf(handles.udpReceive);
set(handles.edit2,'string',str);
%=============================


function pushbutton6_Callback(hObject, eventdata, handles)
%关闭接收数据端UDP
fclose(handles.udpReceive);
delete(handles.udpReceive);
clear ipLocal portReceive_Local ipTransmit_Remote portTransmit_Remote 
%=============================


function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



