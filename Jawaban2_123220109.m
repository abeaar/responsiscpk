function varargout = Jawaban2_123220109(varargin)
% JAWABAN2_123220109 MATLAB code for Jawaban2_123220109.fig
%      JAWABAN2_123220109, by itself, creates a new JAWABAN2_123220109 or raises the existing
%      singleton*.
%
%      H = JAWABAN2_123220109 returns the handle to a new JAWABAN2_123220109 or the handle to
%      the existing singleton*.
%
%      JAWABAN2_123220109('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JAWABAN2_123220109.M with the given input arguments.
%
%      JAWABAN2_123220109('Property','Value',...) creates a new JAWABAN2_123220109 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Jawaban2_123220109_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Jawaban2_123220109_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Jawaban2_123220109

% Last Modified by GUIDE v2.5 25-May-2024 14:21:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Jawaban2_123220109_OpeningFcn, ...
                   'gui_OutputFcn',  @Jawaban2_123220109_OutputFcn, ...
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


% --- Executes just before Jawaban2_123220109 is made visible.
function Jawaban2_123220109_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Jawaban2_123220109 (see VARARGIN)

% Choose default command line output for Jawaban2_123220109
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Jawaban2_123220109 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Jawaban2_123220109_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnProses.
function btnProses_Callback(hObject, eventdata, handles)
% hObject    handle to btnProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%NGAMBIL DATA DARI CSV
opts = detectImportOptions('smartphone.csv');
opts.SelectedVariableNames(1:7);
data = readtable('smartphone.csv', opts);
data = table2cell(data); 
data = data(:, 1:7);
set(handles.tableMain, 'Data', data); 

bobot = [0.25 0.20 0.15 0.12 0.1 0.2]; 
k = [1, 1, 1, 1, 1, 1];
dataTable = get(handles.tableMain, 'Data'); 
dataTable = dataTable(:, 4:7)
dataTable = cell2mat(dataTable); 
disp('dataTable');


bobot = bobot./sum(bobot);
disp('bobot');
disp(bobot); 


[m n] = size(dataTable);
R = zeros(m, n);
skor = zeros(m, 1);
for j = 1:n,
    
    if k(j)==1
        R(:, j)= dataTable(:, j)./max(dataTable(:, j));
    else 
        R(:, j)= min(dataTable(:, j))./dataTable(:, j);
    end
end
disp('Hasil normalisasi matriks');
disp(R);


for i = 1:m
    skor(i)= sum(bobot.*R(i, :));
end 
disp('skor');
disp(skor);
skor = num2cell(skor);
disp('skor');
disp(skor);


data = readtable('smartphone.csv');
data = table2cell(data); 
data = data(:, 1); 
data = [skor, data]; 
data = sortrows(data, -1);

data = data(1:10, :)
set(handles.tableRekomendasi, 'data', data);
disp('data');
disp(data);
