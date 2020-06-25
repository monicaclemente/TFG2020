%% Funcio primera tirada

function [n_tirada,T_fitxes,extrem_dret,extrem_esquerra,F_dreta,F_esquerra,num1,num2] = primera_tirada
 %% Adquisició
 
    clear;

    %llegir imatge<
    cam = webcam('Microsoft® LifeCam VX-2000');
    I = snapshot(cam);
    imshow(I);

    %guardar la imatge a anterior, per el processat de les següents fitxes
    anterior = I;
    directori = '/Users/moni/Documents/MATLAB/';
    nom_arxiu = 'anterior.jpg';
    fulldirectori = fullfile(directori, nom_arxiu);
    imwrite(anterior, fulldirectori);

%% Pre-processat

    %passar la imatge a escala de grisos
    I_1 = rgb2gray(I);
    
    %trobar l'umbral adequat segons l'histograma
    umbral = graythresh(I_1);

    %passar la imatge a binaria
    I_2 = imbinarize(I_1,umbral);
    %imshow(I_2);

    %invertir imatge binaria
    I_3 = imcomplement(I_2);
    %imshow(I_3);

    %eliminar el perfil de la fitxa o qualsevol sombra
    sombra = bwpropfilt(I_3,'MinorAxisLength',[50 1000]); %imshow(sombra);
    I_4=I_3-sombra; 
    %imshow(I_4);



%% Etiquetar

    %etiquetar cada objecte de la imatge
    [L, Ne] = bwlabel(I_4);

    %calcular propietats de cada objecte de la imatge
    prop = regionprops(L,'All');
    hold on

    %marcar boundingbox linea
    for j=1:length(prop)
        if(prop(j).Eccentricity>0.95)
           o = prop(j).Orientation;  
           pos = prop(j).Centroid;
        end
    end

%% Rotar


    %rotar imatge

    I_5 = imrotate(I_4,-o);
    %imshow(I_5);

    %cierre
    se = strel('line',10,2);
    I_final = imclose(I_5,se);
    %imshow(I_final);

    %etiquetar cada objecte de la imatge
    [L2, Ne2] = bwlabel(I_final);

    %calcular propietats de cada objecte de la imatge
    prop2 = regionprops(L2,'All');
    hold on

    %marcar boundingbox linea
    for j=1:length(prop2)
        if(prop2(j).Eccentricity>0.95)
            r2 = rectangle('Position',prop2(j).BoundingBox,'EdgeColor','g','LineWidth',2);
            pos2 = prop2(j).Centroid;

        end
    end


%% Contar valors fitxa


    %contador valor fitxa
    num1 = 0;
    num2 = 0;

    for m=1:length(prop2)

        %extreure el numero superior de la fitxa
        if(prop2(m).Centroid(:,2)<pos2(:,2)) % (:,2)columna numero 2 de centorid, o position == y
            num1 = num1+1;
        end

        %extreure el numero inferior de la fitxa
        if(prop2(m).Centroid(:,2)>pos2(:,2))
            num2 = num2+1;   
        end

    end

%% Guardar imatge

    %guardar imatge jugada
   % directori = '/Users/moni/Documents/MATLAB/Jugades';
  %  nom_arxiu = [num2str(num1) num2str(num2) '.jpg'];
  %  fulldirectori = fullfile(directori, nom_arxiu);
   % imwrite(I_final, fulldirectori);**

%% Funcions d'entrada i sortida de variables

    %contador de n_tirada
    n_tirada = 0; %al ser la primera tirada, inicialitzem el valor
    n_tirada = contador(n_tirada);

    %S'inicialitza la Taula per guardar la informació de cada fitxa jugada
    T_fitxes = table(n_tirada,pos,num1,num2);
    %T_fitxes = guardar_t(T_fitxes,n_tirada,pos,num1,num2);

    %inicialitzar els numeros extrems de les cadenes
    extrem_dret = num1;
    extrem_esquerra = num2;

    %inicialitzar informació fitxes extrems
    F_dreta = table(pos,num1,num2,'VariableNames',{'posicio','num1','num2'});
    F_esquerra = table(pos,num1,num2,'VariableNames',{'posicio','num1','num2'});

end