function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 02-Nov-2012 15:04:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

%plot car in top corner
global a;
a = arduino('com3');
carImage = imread('car.jpg');
arrowLeft = imread('arrowLeft.jpg');
arrowRight = imread('arrowRight.jpg');
arrowUp = imread('arrowUp.jpg');
arrowDown = imread('arrowDown.jpg');



% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Deccelerate.
function Deccelerate_Callback(hObject, eventdata, handles)
% hObject    handle to Deccelerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
arrowDown = imread('arrowDown.jpg');
imshow(arrowDown);


% --- Executes on button press in Left.
function Left_Callback(hObject, eventdata, handles)
% hObject    handle to Left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
arrowLeft = imread('arrowLeft.jpg');
imshow(arrowLeft);


% --- Executes on button press in Right.
function Right_Callback(hObject, eventdata, handles)
% hObject    handle to Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
arrowRight = imread('arrowRight.jpg');
imshow(arrowRight);


% --- Executes on button press in Accelerate.
function Accelerate_Callback(hObject, eventdata, handles)
% hObject    handle to Accelerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
arrowUp = imread('arrowUp.jpg');
imshow(arrowUp);




% --- Executes during object creation, after setting all properties.
function speed1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% display down arrow on compass when down arrow key pressed
switch eventdata.Key
    case 'uparrow'
        % read in image of up arrow
        up = imread('arrowUp.jpg');
        % display image of up arrow
        imshow(up);

        %send data to arduno board 'a' to make pin 13 send a pulse
        %create serial object plugged into com3
        a.pinmode(13,'output');
        a.digitalWrite(9,1);
        
       
end

% display up arrow on compass when up arrow key pressed
%switch eventdata.Key
    %case 'downarrow'
        % read in image of down arrow
        %down = imread('arrowDown.jpg');
        % display right arrow image
       % imshow(down);
        
%end
        
        

% display right arrow on compass when right key pressed
switch eventdata.Key
    case 'rightarrow'
        % read in image of right arrow
        right = imread('arrowRight.jpg');
        % display right arrow image
        imshow(right);

       
end

% display left arrow on compass when left arrow key pressed
switch eventdata.Key
    case 'leftarrow'
        % read in image of left arrow
        left = imread('arrowLeft.jpg');
        % display left arrow image
        imshow(left);
         
       
end
