function varargout = EDT(varargin)
% EDT MATLAB code for EDT.fig
%      EDT, by itself, creates a new EDT or raises the existing
%      singleton*.
%
%      H = EDT returns the handle to a new EDT or the handle to
%      the existing singleton*.
%
%      EDT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDT.M with the given input arguments.
%
%      EDT('Property','Value',...) creates a new EDT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EDT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EDT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose 'GUI allows only one
%      instance to run (singleton)'.
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EDT

% Last Modified by GUIDE v2.5 17-Apr-2019 00:11:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EDT_OpeningFcn, ...
                   'gui_OutputFcn',  @EDT_OutputFcn, ...
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


% --- Executes just before EDT is made visible.
function EDT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EDT (see VARARGIN)

% Choose default command line output for EDT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EDT wait for user response (see UIRESUME)
% uiwait(handles.uipanel1);


% --- Outputs from this function are returned to the command line.
function varargout = EDT_OutputFcn(hObject, eventdata, handles) 
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
            a=get(handles.edNumero,'String');

            [b1,b2,tipo,err ] = validacion(a);
            if (err==1)
                if(tipo==1)
                    [n1,n2]=  pol2bin(b1,b2);
                    set(handles.lbDetalleNumero,'string','Polar');
                    set(handles.lbDetalleConvertido,'string','Binomica');
                else
                    [n1,n2]=  bin2pol(b1,b2);
                    set(handles.lbDetalleConvertido,'string','Polar');
                    set(handles.lbDetalleNumero,'string','Binomica');
                end
                set(handles.edConvertido,'string', concatcomplex(n1,n2,tipo));
       
       
            else
                set(handles.lbDetalleConvertido,'string','');
                set(handles.lbDetalleNumero,'string','');
                set(handles.edConvertido,'string','ERROR DATO, Vuelve a ingresarlo');
            end
   
            
            
            

function [ mod,ang ] = bin2pol( real,img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    mod=sqrt(real^2+img^2);
    ang_=atan(img/real);
    if(real>0 && img>0)
       ang=ang_;
    elseif(real>0 && img<0)
       ang=ang_+2*pi;
    else
       ang=ang_+pi;
    end        



function [ real,img,err ] = pol2bin( mod,ang )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if (mod>=0)
        real=mod*cos(ang);
        img=mod*sin(ang);
        err=1;
    else
        err=0;
    end

        
            


function [ b1,b2,tipo,err ] = validacion(a)
%UNTITLED Summary of this function goes here
%   se la pasa un string y devuelve que tipo de valor polar o binomica, si
%   es valido el ingreso de dato y seccionado
len = strlength(a);

if (a(1)=='(' && a(len)==')' && count(a,',')==1 && count(a,'(')==1 && count(a,')')==1)
        binomica=erase(a,'(');
        binomica=erase(binomica,')');
        binomica_separado=strsplit(binomica,',');
        [real,realer]=str2num(binomica_separado{1});
        [img,imger]=str2num(binomica_separado{2});
        if(realer==1&&imger==1)
            b1=real;
            b2=img;
            tipo=0;
            err=1;   
                       
        else
            b1=-1;
            b2=-1;
            tipo=-1;
            err=0;
        end
        
       elseif (a(1)=='[' && a(len)==']' && count(a,';')==1 && count(a,'[')==1 && count(a,']')==1)

        polar=erase(a,'[');
        polar=erase(polar,']');
        polar_separado=strsplit(polar,';');
        [mod,moder]=str2num(polar_separado{1});
        [ang,anger]=str2num(polar_separado{2});
        if(moder==1&&anger==1 && mod>=0)
            b1=mod;
            b2=ang;
            tipo=1;
            err=1;           
        else
            b1=-1;
            b2=-1;
            tipo=-1;
            err=0;
        end

    else
            b1=-1;
            b2=-1;
            tipo=-1;
            err=0;
end




function [ c ] = concatcomplex( b1,b2,tipo )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if (tipo==0)
        c=strcat('[',num2str(b1),';',num2str(b2),']');
    elseif (tipo==1)
        c=strcat('(',num2str(b1),',',num2str(b2),')');
    end
function edConvertido_Callback(hObject, eventdata, handles)
% hObject    handle to edConvertido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edConvertido as text
%        str2double(get(hObject,'String')) returns contents of edConvertido as a double


% --- Executes during object creation, after setting all properties.
function edConvertido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edConvertido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbVolver.
function pbVolver_Callback(hObject, eventdata, handles)
% hObject    handle to pbVolver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    close(EDT);
    Menu;