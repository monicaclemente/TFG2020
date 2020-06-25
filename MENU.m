function varargout = MENU(varargin)
% MENU MATLAB code for MENU.fig
%      MENU, by itself, creates a new MENU or raises the existing
%      singleton*.
%
%      H = MENU returns the handle to a new MENU or the handle to
%      the existing singleton*.
%
%      MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU.M with the given input arguments.
%
%      MENU('Property','Value',...) creates a new MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MENU_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MENU_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MENU

% Last Modified by GUIDE v2.5 22-May-2020 10:08:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MENU_OpeningFcn, ...
                   'gui_OutputFcn',  @MENU_OutputFcn, ...
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


% --- Executes just before MENU is made visible.
function MENU_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MENU (see VARARGIN)

% Choose default command line output for MENU
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MENU wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MENU_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jugador_1 = get(handles.edit1,'string');
set(handles.edit3,'string',jugador_1);
n_jugadors=handles.n_jugadors;
if(n_jugadors==2)
    j1=7;
    j2=7;
elseif(n_jugadors==3)
    j1=7;
    j2=7;
    j3=7;
    handles.j3=j3;
elseif(n_jugadors==4)
    j1=6;
    j2=6;
    j3=6;
    j4=6;
    handles.j3=j3;
    handles.j4=j4;
end
handles.j1=j1;
handles.j2=j2;
guidata(hObject,handles);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n_t,t_f,e_d,e_e,f_d,f_e,n_1,n_2] = primera_tirada;
handles.n_t = n_t;
handles.t_f = t_f;
handles.e_d = e_d;
handles.e_e = e_e;
handles.f_d = f_d;
handles.f_e = f_e;
handles.n_1 = n_1;
handles.n_2 = n_2;

%contador de cada número
num_0 = 0;
num_1 = 0;
num_2 = 0;
num_3 = 0;
num_4 = 0;
num_5 = 0;
num_6 = 0;

if (n_1 == 6)
    num_6 = num_6+1;
elseif (n_1 == 5)
    num_5 = num_5+1;
elseif (n_1 == 4)
    num_4 = num_4+1;
elseif (n_1 == 3)
    num_3 = num_3+1;
elseif (n_1 == 2)
    num_2 = num_2+1;
elseif (n_1 == 1)
    num_1 = num_1+1;
elseif (n_1 == 0)
    num_0 = num_0+1;
end

if (n_2 == 6)
    num_6 = num_6+1;
elseif (n_2 == 5)
    num_5 = num_5+1;
elseif (n_2 == 4)
    num_4 = num_4+1;
elseif (n_2 == 3)
    num_3 = num_3+1;
elseif (n_2 == 2)
    num_2 = num_2+1;
elseif (n_2 == 1)
    num_1 = num_1+1;
elseif (n_2 == 0)
    num_0 = num_0+1;
end

handles.num_0 = num_0;
handles.num_1 = num_1;
handles.num_2 = num_2;
handles.num_3 = num_3;
handles.num_4 = num_4;
handles.num_5 = num_5;
handles.num_6 = num_6;
%
set(handles.edit4,'string',n_t);
set(handles.edit5,'string',e_d);
set(handles.edit6,'string',e_e);

jugador_2 = get(handles.edit2,'string');
set(handles.edit3,'string',jugador_2);
j1=handles.j1;
j1=j1-1;
handles.j1=j1;
j2=handles.j2;
handles.j2=j2;
set(handles.edit10,'string',j1);
set(handles.edit11,'string',j2);

n_jugadors=handles.n_jugadors;

if (n_jugadors==3)
    j3=handles.j3;
    handles.j3=j3;
    set(handles.edit16,'string',j3);
elseif(n_jugadors==4)
    j3=handles.j3;
    handles.j3=j3;
    j4=handles.j4;
    handles.j4=j4;
    set(handles.edit16,'string',j3);
set(handles.edit17,'string',j4);
end

guidata(hObject,handles);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n_t = handles.n_t;
t_f = handles.t_f;
e_d = handles.e_d;
e_e = handles.e_e;
f_d = handles.f_d;
f_e = handles.f_e;

[n_tirada,T_fitxes,extrem_dret,extrem_esquerra,F_dreta,F_esquerra,eval,num1,num2] = seguent_tirada (n_t,t_f,e_d,e_e,f_d,f_e);

n_t = n_tirada;
t_f = T_fitxes;
e_d = extrem_dret;
e_e = extrem_esquerra;
f_d = F_dreta;
f_e = F_esquerra;
n_1 = num1;
n_2 = num2;


%contar numeros
num_0 = handles.num_0;
num_1 = handles.num_1;
num_2 = handles.num_2;
num_3 = handles.num_3;
num_4 = handles.num_4;
num_5 = handles.num_5;
num_6 = handles.num_6;

if (n_1 == 6)
    num_6 = num_6+1;
elseif (n_1 == 5)
    num_5 = num_5+1;
elseif (n_1 == 4)
    num_4 = num_4+1;
elseif (n_1 == 3)
    num_3 = num_3+1;
elseif (n_1 == 2)
    num_2 = num_2+1;
elseif (n_1 == 1)
    num_1 = num_1+1;
elseif (n_1 == 0)
    num_0 = num_0+1;
end

if (n_2 == 6)
    num_6 = num_6+1;
elseif (n_2 == 5)
    num_5 = num_5+1;
elseif (n_2 == 4)
    num_4 = num_4+1;
elseif (n_2 == 3)
    num_3 = num_3+1;
elseif (n_2 == 2)
    num_2 = num_2+1;
elseif (n_2 == 1)
    num_1 = num_1+1;
elseif (n_2 == 0)
    num_0 = num_0+1;
end

handles.num_0 = num_0;
handles.num_1 = num_1;
handles.num_2 = num_2;
handles.num_3 = num_3;
handles.num_4 = num_4;
handles.num_5 = num_5;
handles.num_6 = num_6;


%

set(handles.edit4,'string',n_t);%n_tirada
set(handles.edit5,'string',e_d);%extrem_dret
set(handles.edit6,'string',e_e);%extrem_esquerra

%saber quants jugadors estan a la partida
n_jugadors=handles.n_jugadors;

%cridar als contadors de fitxes.
j1 = handles.j1;
j2 = handles.j2;
jugador_1 = get(handles.edit1,'string');
jugador_2 = get(handles.edit2,'string');
if(n_jugadors==3)
    j3 = handles.j3;
    jugador_3 = get(handles.edit14,'string');
elseif(n_jugadors==4)
    j3 = handles.j3;
    j4 = handles.j4;
    jugador_3 = get(handles.edit14,'string');
    jugador_4 = get(handles.edit15,'string');
end
        
%torn i fitxes
if (get(handles.edit3,'string')==jugador_1)
    set(handles.edit3,'string',jugador_2);
    j1=j1-1;
elseif(get(handles.edit3,'string')==jugador_2)
    if(n_jugadors==2)
        set(handles.edit3,'string',jugador_1);
    elseif(n_jugadors>2)
        set(handles.edit3,'string',jugador_3);
    end
    j2=j2-1;
elseif(get(handles.edit3,'string')==jugador_3)
    if(n_jugadors==3)
        set(handles.edit3,'string',jugador_1);
    elseif(n_jugadors==4)
        set(handles.edit3,'string',jugador_4);
    end
    j3=j3-1;
elseif(get(handles.edit3,'string')==jugador_4)
    set(handles.edit3,'string',jugador_1);
    j4=j4-1;
end

%fitxes mal tirades
alert = 'Alerta: fitxa mal tirada!';
if eval==1
    set(handles.edit7,'string',alert); 
    if (get(handles.edit3,'string')==jugador_2)
        set(handles.edit3,'string',jugador_1);
        j1=j1+1; %si la fitxa no ha estat ben tirada, li torno a sumar 1 al contador
    elseif(get(handles.edit3,'string')==jugador_3)
        set(handles.edit3,'string',jugador_2);
        j2=j2+1;
    elseif(get(handles.edit3,'string')==jugador_4)
        set(handles.edit3,'string',jugador_3);
        j3=j3+1;
    elseif(get(handles.edit3,'string')==jugador_1)
        if(n_jugadors==2)
            set(handles.edit3,'string',jugador_2);
            j2=j2+1;
        elseif(n_jugadors==3)
            set(handles.edit3,'string',jugador_3);
            j3=j3+1;
        elseif (n_jugadors==4)
            set(handles.edit3,'string',jugador_4);
            j4=j4+1;
        end
    end
else
    res = ' ';
    set(handles.edit7,'string',res);
end

%condició de guanyar el joc
if n_tirada==27
    if (get(handles.edit3,'string')==jugador_2)
        myicon = imread('pulgar.jpg');
        h=msgbox('El jugador 1 ha guanyat la partida!','Success','custom',myicon);
    elseif (get(handles.edit3,'string')==jugador_3) 
        myicon = imread('pulgar.jpg');
        h=msgbox('El jugador 2 ha guanyat la partida!','Success','custom',myicon);
    elseif (get(handles.edit3,'string')==jugador_4) 
        myicon = imread('pulgar.jpg');
        h=msgbox('El jugador 3 ha guanyat la partida!','Success','custom',myicon);
    elseif (get(handles.edit3,'string')==jugador_1) 
        if(n_jugadors==2)
            myicon = imread('pulgar.jpg');
            h=msgbox('El jugador 2 ha guanyat la partida!','Success','custom',myicon);
        elseif(n_jugadors==3)
            myicon = imread('pulgar.jpg');
            h=msgbox('El jugador 3 ha guanyat la partida!','Success','custom',myicon);
        elseif (n_jugadors==4)
            myicon = imread('pulgar.jpg');
            h=msgbox('El jugador 4 ha guanyat la partida!','Success','custom',myicon);
        end
    end
elseif j1==0
        myicon = imread('pulgar.jpg');
        h=msgbox('El jugador 1 ha guanyat la partida!','Success','custom',myicon);
elseif j2==0
        myicon = imread('pulgar.jpg');
        h=msgbox('El jugador 2 ha guanyat la partida!','Success','custom',myicon);
elseif (n_jugadors==3)
         if j3==0
            myicon = imread('pulgar.jpg');
            h=msgbox('El jugador 3 ha guanyat la partida!','Success','custom',myicon);
         end
elseif n_jugadors==4
        if j4==0
            myicon = imread('pulgar.jpg');
            h=msgbox('El jugador 1 ha guanyat la partida!','Success','custom',myicon);
        end
end

%si la partida es queda tancada

if (e_d == e_e)
    if ((e_d==6 && num_6==8)||(e_d==5 && num_5==8)||(e_d==4 && num_4==8)||(e_d==3 && num_3==8)||(e_d==2 && num_2==8)||(e_d==1 && num_1==8)||(e_d==0 && num_0==8))
        h=msgbox('La partida ha quedat tancada, qui amb les seves fitxes sumi un valor més baix serà el guanyador!','Success');
    end
end

handles.j1=j1;
handles.j2=j2;
if (n_jugadors==3)
    handles.j3=j3;
    set(handles.edit16,'string',j3);
elseif(n_jugadors==4)
    handles.j3=j3;
    handles.j4=j4;
    set(handles.edit16,'string',j3);
    set(handles.edit17,'string',j4);
end

set(handles.edit10,'string',j1);
set(handles.edit11,'string',j2);

handles.n_t = n_t;
handles.t_f = t_f;
handles.e_d = e_d;
handles.e_e = e_e;
handles.f_d = f_d;
handles.f_e = f_e;


guidata(hObject,handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%saber quants jugadors estan a la partida
n_jugadors=handles.n_jugadors;

%cridar als contadors de fitxes.
j1 = handles.j1;
j2 = handles.j2;
if (n_jugadors==3)
    j3 = handles.j3;
end
if (n_jugadors==4)
    j3 = handles.j3;
    j4 = handles.j4;
end

jugador_1 = get(handles.edit1,'string');
jugador_2 = get(handles.edit2,'string');
jugador_3 = get(handles.edit14,'string');
jugador_4 = get(handles.edit15,'string');

if (get(handles.edit3,'string')==jugador_2)
    set(handles.edit3,'string',jugador_1);   
elseif (n_jugadors==3)
    if (get(handles.edit3,'string')==jugador_3) 
        set(handles.edit3,'string',jugador_2);
    end
elseif (n_jugadors==4)
    if (get(handles.edit3,'string')==jugador_4) 
        set(handles.edit3,'string',jugador_3); 
    end
elseif (get(handles.edit3,'string')==jugador_1) 
    if(n_jugadors==2)
        set(handles.edit3,'string',jugador_2); 
    elseif(n_jugadors==3)
        set(handles.edit3,'string',jugador_3); 
    elseif (n_jugadors==4)
        set(handles.edit3,'string',jugador_4); 
    end
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%saber quants jugadors estan a la partida
n_jugadors=handles.n_jugadors;

%cridar als contadors de fitxes.
j1 = handles.j1;
j2 = handles.j2;
if (n_jugadors==3)
    j3 = handles.j3;
end
if (n_jugadors==4)
    j3 = handles.j3;
    j4 = handles.j4;
end



%torn i fitxes
jugador_1 = get(handles.edit1,'string');
jugador_2 = get(handles.edit2,'string');
jugador_3 = get(handles.edit14,'string');
jugador_4 = get(handles.edit15,'string');

if (get(handles.edit3,'string')==jugador_2)
    j2=j2+1;
elseif (n_jugadors==3)
        if (get(handles.edit3,'string')==jugador_3)
            j3=j3+1;
        end
elseif (n_jugadors==4)
        if (get(handles.edit3,'string')==jugador_4)
            j4=j4+1;
        end
elseif (get(handles.edit3,'string')==jugador_1)
    j1=j1+1;
end

handles.j1=j1;
handles.j2=j2;
handles.j3=j3;
handles.j4=j4;

guidata(hObject,handles);
set(handles.edit10,'string',j1);
set(handles.edit11,'string',j2);
set(handles.edit16,'string',j3);
set(handles.edit17,'string',j4);



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
n_jugadors=get(handles.popupmenu1,'value');
if(n_jugadors==2)
    set(handles.edit1,'enable','on');
    set(handles.edit2,'enable','on');
    set(handles.edit14,'enable','off');
    set(handles.edit15,'enable','off');
elseif(n_jugadors==3)
    set(handles.edit1,'enable','on');
    set(handles.edit2,'enable','on');
    set(handles.edit14,'enable','on');
    set(handles.edit15,'enable','off');
elseif(n_jugadors==4)
    set(handles.edit1,'enable','on');
    set(handles.edit2,'enable','on');
    set(handles.edit14,'enable','on');
    set(handles.edit15,'enable','on');
end
handles.n_jugadors=n_jugadors;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
