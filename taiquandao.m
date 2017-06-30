function varargout = taiquandao(varargin)
% TAIQUANDAO MATLAB code for taiquandao.fig
%      TAIQUANDAO, by itself, creates a new TAIQUANDAO or raises the existing
%      singleton*.
%
%      H = TAIQUANDAO returns the handle to a new TAIQUANDAO or the handle to
%      the existing singleton*.
%
%      TAIQUANDAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAIQUANDAO.M with the given input arguments.
%
%      TAIQUANDAO('Property','Value',...) creates a new TAIQUANDAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before taiquandao_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to taiquandao_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help taiquandao

% Last Modified by GUIDE v2.5 30-Jun-2017 10:07:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @taiquandao_OpeningFcn, ...
                   'gui_OutputFcn',  @taiquandao_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before taiquandao is made visible.
function taiquandao_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to taiquandao (see VARARGIN)

% Choose default command line output for taiquandao
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes taiquandao wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = taiquandao_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

while(1)
    in = inputfromhuju();
    if in >100
        imshow(imread('pic/front.png'));
    else
        imshow(imread('pic/back.png'));
    end
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% imshow(imread('pic/front.png'));


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow(imread('pic/back.png'));

% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('pic/none.png'));
% Hint: place code in OpeningFcn to populate axes1
