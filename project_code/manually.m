function varargout = manually(varargin)
% MANUALLY MATLAB code for manually.fig
%      MANUALLY, by itself, creates a new MANUALLY or raises the existing
%      singleton*.
%
%      H = MANUALLY returns the handle to a new MANUALLY or the handle to
%      the existing singleton*.
%
%      MANUALLY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUALLY.M with the given input arguments.
%
%      MANUALLY('Property','Value',...) creates a new MANUALLY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manually_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manually_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manually

% Last Modified by GUIDE v2.5 08-Jun-2019 12:47:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manually_OpeningFcn, ...
                   'gui_OutputFcn',  @manually_OutputFcn, ...
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


% --- Executes just before manually is made visible.
function manually_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manually (see VARARGIN)

% Choose default command line output for manually
handles.output = hObject;
global pass
pass='';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manually wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manually_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double
paswd=get(handles.res,'string')

% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global res;
global L;
res=[];
set(handles.res,'string','');
pass=input('','s');
L=strlength(pass);
dis='*';
b='';
for i=1:L
    b=strcat(dis,b);
end
set(handles.res,'string',b);
%%L=strlength(pass)
%for i=1:L
%   current=get(handles.res,'string')
%    current{end+1}='*'
  
%end

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.res,'string','');
pass='';


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%numberpassword;
global pass cno
L=length(pass);
flag=0;
if isequal(L,3) && ~isempty(cno)
    load db;

num=cno;

    if strcmpi(db1(num).passwd,pass)
        flag=1;
      
    end
end

if isequal(L,3) && flag
    set(handles.res,'string','valid ');
else
    set(handles.res,'string','Invalid Password or Card number');
end
pass='';
cno=[];


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
welcome;
closereq;


% --- Executes on key press with focus on res and none of its controls.
function res_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global pass
key=get(gcf,'currentKey');
if strcmpi(key,'backspace')
    if ~isempty(pass)
    pass(end)=[];
    end
    l=length(pass);
s(1:l)='*';
set(handles.res,'string',s);
    return;
end
pass=[pass,key];
l=length(pass);
s(1:l)='*';
set(handles.res,'string',s);
