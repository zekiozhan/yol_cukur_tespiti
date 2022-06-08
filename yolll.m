function varargout = yolll(varargin)
% YOLLL MATLAB code for yolll.fig
%      YOLLL, by itself, creates a new YOLLL or raises the existing
%      singleton*.
%
%      H = YOLLL returns the handle to a new YOLLL or the handle to
%      the existing singleton*.
%
%      YOLLL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YOLLL.M with the given input arguments.
%
%      YOLLL('Property','Value',...) creates a new YOLLL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before yolll_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to yolll_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help yolll

% Last Modified by GUIDE v2.5 28-May-2022 12:09:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yolll_OpeningFcn, ...
                   'gui_OutputFcn',  @yolll_OutputFcn, ...
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


% --- Executes just before yolll is made visible.
function yolll_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to yolll (see VARARGIN)

% Choose default command line output for yolll
handles.output = hObject;

% Update handles structure
set(handles.axes1,'visible','off');
set(handles.axes2,'visible','off');
set(handles.axes3,'visible','off');
set(handles.edit1,'visible','off');
set(handles.text2,'visible','off');

guidata(hObject, handles);

% UIWAIT makes yolll wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = yolll_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



resim11= uigetfile({'*.jpg';'*.jpeg';'*.png'});
resim1=imread(resim11);

resim=imresize(resim1, [240 320]);

axes(handles.axes1)
imshow(resim)

gri=rgb2gray(resim);

axes(handles.axes2)
imshow(gri);

filtre=edge(gri,'sobel');

axes(handles.axes3);
imshow(filtre)

esik=imbinarize(gri, 0.50);
asd=bwareaopen(esik,20);
%  imshow(asd);
% imshow(esik);

bw=bwmorph(asd,'clean',20);
% imshow(bw)

siyah=sum(bw(:) == 0);
beyaz=sum(bw(:) == 1);
a=siyah*0.65;
 
if a<beyaz
    
    set(handles.edit1,'string','yol çukurlu');
    
     
else 
    
   set(handles.edit1,'string','yol çukursuz');
   
  
end

set(handles.edit1,'visible','on');
set(handles.text2,'visible','on');

handles.aa=get(handles.edit1,'string');
handles.ab=get(handles.edit2,'string');
z=[handles.aa];

    uisave({'z'},handles.ab)
  
    

   
    
    guidata(hObject, handles);
    
%     load('var1.mat')
% handles.aa=get(handles.edit1,'string');
% handles.z=[handles.aa,hadnles.ab]
% 
%     uisave({'handles.z'},'var1')
%     
%     guidata(hObject, handles);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

 
