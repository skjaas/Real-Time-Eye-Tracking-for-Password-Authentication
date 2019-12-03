function varargout = selection(varargin)
% SELECTION MATLAB code for selection.fig
%      SELECTION, by itself, creates a new SELECTION or raises the existing
%      singleton*.
%
%      H = SELECTION returns the handle to a new SELECTION or the handle to
%      the existing singleton*.
%
%      SELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECTION.M with the given input arguments.
%
%      SELECTION('Property','Value',...) creates a new SELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before selection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to selection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help selection

% Last Modified by GUIDE v2.5 08-Jun-2019 12:05:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selection_OpeningFcn, ...
                   'gui_OutputFcn',  @selection_OutputFcn, ...
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


% --- Executes just before selection is made visible.
function selection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to selection (see VARARGIN)

% Choose default command line output for selection
handles.output = hObject;
global cnt cardnum cno
cnt=0;
cardnum='';
cno=[];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes selection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = selection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cardNumber.
function cardNumber_Callback(hObject, eventdata, handles)
% hObject    handle to cardNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cardnumber;
global f;
f=0;
global number;
% number='';
number=get(handles.numberRead,'string');
L=strlength(number);
if isempty(number)
    set(handles.numberRead,'string','Enter valid card number');
end
if isequal(L,10)
    f=1;
    set(handles.numberRead,'string',number);
    cardnumber=number;
else
    set(handles.numberRead,'string','Enter valid card number');
end
    



% --- Executes on button press in hand.
function hand_Callback(hObject, eventdata, handles)
% hObject    handle to hand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
manually;
closereq;


% --- Executes on button press in gazing.
function gazing_Callback(hObject, eventdata, handles)
% hObject    handle to gazing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   interface;
   closereq;


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.numberRead,'string','');



function numberRead_Callback(hObject, eventdata, handles)
% hObject    handle to numberRead (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberRead as text
%        str2double(get(hObject,'String')) returns contents of numberRead as a double


% --- Executes during object creation, after setting all properties.
function numberRead_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberRead (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on numberRead and none of its controls.
function numberRead_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to numberRead (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global cno
global cnt cardnum
if cnt<0
    cnt=0;
end
key=get(gcf,'currentKey');
cardnum=[cardnum,key];
if strcmpi(key,'backspace')
    cnt=cnt-1;
    if ~isempty(cardnum)
    cardnum(end)=[];
    end
    return;
end
cnt=cnt+1
if cnt ==12
    cnt=0;    
    load db;
num=length(db1);
flag=0;
for j=1:num
    if strcmpi(db1(j).cardnum,cardnum)
        flag=1;
        cno=j;
        break;
    end
end
cardnum='';
if flag
    set(handles.numberRead,'string','valid card');
else
    set(handles.numberRead,'string','invalid')
end
end
