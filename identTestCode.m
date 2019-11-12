%dynamic model with identified constants of delta robot
%loading identified theta constants of dynamic model
load('constantes_ident_lagrange_val_delta_2.mat')

%Loading trajectory planner: joint positions
%Read planner data
fileID = fopen('planner_posicionArticular3.txt','r');
formatSpec = '%f %f %f %f';
sizeA = [4 Inf];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A=A';
%data separation
tiempo1=A(:,1);
q1d=A(:,2);
q2d=A(:,3);
q3d=A(:,4);
%creation joint position vectors for matlab
q1s=[tiempo1 q1d];
q2s=[tiempo1 q2d];
q3s=[tiempo1 q3d];


%loading trajectory planner: XYZ cordinates
fileID = fopen('planner_posicionXYZ3.txt','r');
formatSpec = '%f %f %f %f';
sizeA = [4 Inf];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A=A';
%Array separation
tiempo=A(:,1);
tiempo(length(tiempo)+1)=tiempo(length(tiempo));
px=A(:,2);
px(length(px)+1)=px(length(px));
py=A(:,3);
py(length(py)+1)=py(length(py));
pz=A(:,4);
pz(length(pz)+1)=pz(length(pz));

%creation input XYZ vectors
pxs=[tiempo px];
pys=[tiempo py];
pzs=[tiempo pz];

%runnig simulink model
sim('robot_delta_din_model_lagrange_teorico_prueba')


