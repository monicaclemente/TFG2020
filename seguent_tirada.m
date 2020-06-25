%% Funcio seguent tirada

function [n_tirada,T_fitxes,extrem_dret,extrem_esquerra,F_dreta,F_esquerra,eval,num1,num2] = seguent_tirada (n_t,t_f,e_d,e_e,f_d,f_e)
%% Adquisició
eval=0; % condició de jugada ben realitzada

%clear;

%llegir imatge
cam = webcam('Microsoft® LifeCam VX-2000');
I = snapshot(cam);
imshow(I);

%% Pre-processat
%%
%llegir imatge anterior
I_anterior = imread('anterior.jpg');

%passar la imatge a escala de grisos
I_1 = rgb2gray(I);
I_1_anterior = rgb2gray(I_anterior);

%trobar l'umbral adequat segons l'histograma
umbral = graythresh(I_1);
umbral_anterior = graythresh(I_1_anterior);

%passar la imatge a binaria
I_2 = imbinarize(I_1,umbral);
I_2_anterior = imbinarize(I_1_anterior,umbral_anterior);
%imshowpair(I_2,I_2_anterior);
%restar imatges
I_3 = I_2-I_2_anterior;

%invertir imatge binaria
I_4 = imcomplement(I_3);


%eliminar el perfil de la fitxa o qualsevol sombra
sombra = bwpropfilt(logical(I_4),'MinorAxisLength',[40 1000]);
I_5=I_4-sombra; 



%% Etiquetar


%etiquetar cada objecte de la imatge
[L, Ne] = bwlabel(I_5);

%calcular propietats de cada objecte de la imatge
prop = regionprops(L,'All');
hold on
a_major=0;
%marcar boundingbox linea
for j=1:length(prop)
    if(prop(j).Eccentricity>0.95 && prop(j).MajorAxisLength>15) %&& prop(j).MinorAxisLength>1)
       a = prop(j).Area; %afageixo aquesta condició per si hi han més linies, ja que en la majoria dels casos, la més gran és la que ens interessa
       if(a>a_major)
           a_major=a;
           o = prop(j).Orientation;  
           pos = prop(j).Centroid; %per calcular despres la posicio de la fitxa en la cadena
       end
    end
end
%% Rotar

if (abs(o)<45) %fitxa vertical
    I_5 = imrotate(I_5,-o);
    %imshow(I_5);
    %apertura morfologica- per eliminar petites taques
    se = strel('line',3,3);
    I_6 = imerode(I_5,se);
   

    %cierre- per fer gran la linea si s'ha partit
    se = strel('line',10,2);
    I_7 = imclose(I_6,se);
  
    
else  %fitxa horitzontal
    if(o<0)
        a=90+o;
        I_5 = imrotate(I_5,-a);
       
    else 
        a=90-o;
        I_5 = imrotate(I_5,a);
    end
    %apertura morfologica- per eliminar petites taques
    se = strel('line',3,3);
    I_6 = imerode(I_5,se);
  

    %cierre- per fer gran la linea si s'ha partit
    se = strel('line',2,10);
    I_7 = imclose(I_6,se);
   
end
%% Tallar
%etiquetar cada objecte de la imatge
[L2, Ne2] = bwlabel(I_7);

%calcular propietats de cada objecte de la imatge
prop2 = regionprops(L2,'All');
hold on

%marcar boundingbox linea
for j=1:length(prop2)%la linea de separació sempre serà la primera en etiquetar
    if(prop2(j).Eccentricity>0.95 && prop2(j).MajorAxisLength>30)
        cord = prop2(j).Extrema;
    end
end

if (abs(o)<45)
    %tallar fitxa vertical
    h = 82;
    w = 34;
    x = cord(8,1);
    y = cord(8,2) - h/2;
    rect = [x y w h];
    I_final = imcrop (I_7,rect);
    imshow(I_final);
else
    %tallar fitxa horitzontal
    h = 34;
    w = 82;
    x = cord(1,1)-w/2;
    y = cord(1,2);
    rect = [x y w h];
    I_final = imcrop (I_7,rect);
    imshow(I_final);
end

%% Contar valors fitxa

%etiquetar cada objecte de la imatge
[L3, Ne3] = bwlabel(I_final);

%calcular propietats de cada objecte de la imatge
prop3 = regionprops(L3,'All');
hold on

%marcar boundingbox linea
for j=1:length(prop3)
    if(prop3(j).Eccentricity>0.95)
        r2 = rectangle('Position',prop3(j).BoundingBox,'EdgeColor','g','LineWidth',2);
        pos2 = prop3(j).Centroid;   
    end
end

%contador valor fitxa
num1 = 0;
num2 = 0;

for m=1:length(prop3)
    if (abs(o)<45)
        %extreure el numero superior de la fitxa
        if(prop3(m).Centroid(:,2)<pos2(:,2)) % (:,2)columna numero 2 de centorid, o position == y
            num1 = num1+1;
        end

        %extreure el numero inferior de la fitxa
        if(prop3(m).Centroid(:,2)>pos2(:,2))
            num2 = num2+1; 
        end
    else
        %extreure el numero de la esquerra de la fitxa
        if(prop3(m).Centroid(:,1)<pos2(:,1)) % (:,2)columna numero 2 de centorid, o position == y
            num1 = num1+1;
        end

        %extreure el numero de la dreta de la fitxa
        if(prop3(m).Centroid(:,1)>pos2(:,1))
            num2 = num2+1;  
        end
    end
    
end

%% Guardar imatge tirada
%%
%guardar imatge
%directori = '/Users/moni/Documents/MATLAB/Jugades';
%nom_arxiu = [num2str(num1) num2str(num2) '.jpg'];
%fulldirectori = fullfile(directori, nom_arxiu);
%imwrite(I_final, fulldirectori);

%guardar la imatge a anterior2
directori = '/Users/moni/Documents/MATLAB/';
nom_arxiu = 'anterior2.jpg';
fulldirectori = fullfile(directori, nom_arxiu);
imwrite(I_anterior, fulldirectori);

%guardar la imatge a anterior, per el processat de les següents fitxes
anterior = I;
directori = '/Users/moni/Documents/MATLAB/';
nom_arxiu = 'anterior.jpg';
fulldirectori = fullfile(directori, nom_arxiu);
imwrite(anterior, fulldirectori);


%% Funcions d'entrada i sortida de variables
%%
%contador de n_tirada
n_tirada = contador(n_t);

%Taula per guardar la informació de cada fitxa jugada
%T_fitxes = table(n_tirada,pos,num1,num2,'VariableNames',{'Tirada','Posicio','Num1','Num2'});
T_fitxes = guardar_t(t_f,n_tirada,pos,num1,num2);

%inicialitzar valors per saber la posició correcte de la fitxa
    x1 = pos(:,1)
    y1 = pos(:,2)
    
   % xn1 = pos_num1(:,1)
    %yn1 = pos_num1(:,2);
   % xn2 = pos_num2(:,1)
   % yn2 = pos_num2(:,2);
 
    
    if(abs(o)<45) %fitxes verticals(-45º)
        xnum1=x1;
        ynum1=y1-20;
        xnum2=x1;
        ynum2=y1+20;
    else %fitxes horitzontals
        xnum1=x1-20;
        ynum1=y1;
        xnum2=x1+20;
        ynum2=y1;
    end
        
    
    x_d = f_d.posicio(:,1);
    y_d = f_d.posicio(:,2);
    x_e = f_e.posicio(:,1);
    y_e = f_e.posicio(:,2);
    
%si és la segona fitxa en tirar de la partida
if n_tirada == 2
    if (x1>(640-x1)) %la fitxa estarà a la dreta si es compleix
        if ((num1 == e_d )  && ((sqrt((xnum1-x_d)^2 + (ynum1-y_d)^2)) < (sqrt((xnum2-x_d)^2 + (ynum2-y_d)^2))))
            extrem_dret = num2;
            extrem_esquerra = e_e; %ho he posar per tenir algo a retornar i que no doni error
        elseif ((num2 == e_d) && ((sqrt((xnum2-x_d)^2 + (ynum2-y_d)^2)) < (sqrt((xnum1-x_d)^2 + (ynum1-y_d)^2))))
            extrem_dret = num1;
            extrem_esquerra = e_e; %ho he posar per tenir algo a retornar i que no doni error
        else
            %es retornen tots els valors que hi havien d'entrada
            n_tirada = n_t;
            T_fitxes = t_f;
            extrem_dret = e_d;
            extrem_esquerra = e_e;
            F_dreta = f_d;
            F_esquerra = f_e;
            %llegir imatge anterior
            anterior_2 = imread('anterior2.jpg');
            directori = '/Users/moni/Documents/MATLAB/';
            nom_arxiu = 'anterior.jpg';
            fulldirectori = fullfile(directori, nom_arxiu);
            imwrite(anterior_2, fulldirectori);
            eval=1; % condició de jugada mal realitzada
        end
       
            F_dreta = table(pos, num1, num2,'VariableNames',{'posicio','num1','num2'}); %actualització fitxa dreta
            F_esquerra = f_e;
    
    else
        
        if ((num1 == e_e )&& ((sqrt((xnum1-x_e)^2 + (ynum1-y_e)^2)) < (sqrt((xnum2-x_e)^2 + (ynum2-y_e)^2))))
            extrem_esquerra = num2;
            extrem_dret = e_d;
        elseif ((num2 == e_e ) && ((sqrt((xnum2-x_e)^2 + (ynum2-y_e)^2)) < (sqrt((xnum1-x_e)^2 + (ynum1-y_e)^2))))
            extrem_esquerra = num1;
            extrem_dret = e_d;
        else
            %es retornen tots els valors que hi havien d'entrada
            n_tirada = n_t;
            T_fitxes = t_f;
            extrem_dret = e_d;
            extrem_esquerra = e_e;
            F_dreta = f_d;
            F_esquerra = f_e;
            %llegir imatge anterior
            anterior_2 = imread('anterior2.jpg');
            directori = '/Users/moni/Documents/MATLAB/';
            nom_arxiu = 'anterior.jpg';
            fulldirectori = fullfile(directori, nom_arxiu);
            imwrite(anterior_2, fulldirectori);
            eval=1; % condició de jugada mal realitzada
        end
        
            F_esquerra = table(pos, num1, num2,'VariableNames',{'posicio','num1','num2'}); %actualització fitxa esquerra
            F_dreta = f_d;
    end
    
else %a partir de la tercera tirada
  
    if (sqrt((x1-x_d)^2 + (y1-y_d)^2)) < (sqrt((x1-x_e)^2 + (y1-y_e)^2))
        if ((num1 == e_d) && ((sqrt((xnum1-x_d)^2 + (ynum1-y_d)^2)) < (sqrt((xnum2-x_d)^2 + (ynum2-y_d)^2))))
                extrem_dret = num2;
                extrem_esquerra = e_e;
        elseif ((num2 == e_d ) && ((sqrt((xnum2-x_d)^2 + (ynum2-y_d)^2)) < (sqrt((xnum1-x_d)^2 + (ynum1-y_d)^2))))
            extrem_dret = num1;
            extrem_esquerra = e_e;
        else
            %es retornen tots els valors que hi havien d'entrada
            n_tirada = n_t;
            T_fitxes = t_f;
            extrem_dret = e_d;
            extrem_esquerra = e_e;
            F_dreta = f_d;
            F_esquerra = f_e;
            %llegir imatge anterior
            anterior_2 = imread('anterior2.jpg');
            directori = '/Users/moni/Documents/MATLAB/';
            nom_arxiu = 'anterior.jpg';
            fulldirectori = fullfile(directori, nom_arxiu);
            imwrite(anterior_2, fulldirectori);
            eval=1; % condició de jugada mal realitzada
        end
       
        F_dreta = table(pos, num1, num2,'VariableNames',{'posicio','num1','num2'}); %actualització fitxa dreta
        F_esquerra = f_e;
        
    else
        
        if ((num1 == e_e ) && ((sqrt((xnum1-x_e)^2 + (ynum1-y_e)^2)) < (sqrt((xnum2-x_e)^2 + (ynum2-y_e)^2))))
            extrem_esquerra = num2;
            extrem_dret = e_d;
        elseif ((num2 == e_e ) && ((sqrt((xnum2-x_e)^2 + (ynum2-y_e)^2)) < (sqrt((xnum1-x_e)^2 + (ynum1-y_e)^2))))
            extrem_esquerra = num1;
            extrem_dret = e_d;
        else
            %es retornen tots els valors que hi havien d'entrada
            n_tirada = n_t;
            T_fitxes = t_f;
            extrem_dret = e_d;
            extrem_esquerra = e_e;
            F_dreta = f_d;
            F_esquerra = f_e;
            %llegir imatge anterior
            anterior_2 = imread('anterior2.jpg');
            directori = '/Users/moni/Documents/MATLAB/';
            nom_arxiu = 'anterior.jpg';
            fulldirectori = fullfile(directori, nom_arxiu);
            imwrite(anterior_2, fulldirectori);
            eval=1; % condició de jugada mal realitzada
        end
        
        F_esquerra = table(pos, num1, num2,'VariableNames',{'posicio','num1','num2'}); %actualització fitxa esquerra
        F_dreta = f_d;
    end
end