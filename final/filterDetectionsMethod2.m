function [xpassed2, ypassed2] = filterDetectionsMethod2(x, y, RGYB, lim_height_rectangle, lim_width_rectangle)

% Detecte si plusieurs max se trouvent dans une zone rectangulaire
% Si oui, il les élimine, si non, il sagit d'un point isolé, donc
% potentiellement un feu.

% En gros, on forme un rectangle avec comme extremité les deux points
% maximaux, et on regarde si celui ci n'est pas trop grand !

% Cette fonction peut être utilisée pour éliminer différentes formes, et
% peut don cêtre utilisé dans un même traitement plusieur fois, afin de
% filtrer différentes formes à la suite.

xpassed2 = [];
ypassed2 = [];

% On introduit un booléen test, car le test est effectué sur plusieurs
% boucle, il faicilite donc la communication du test en sortie de boucle
test = true;

for i =1:size(x, 2)
%     On balaye valeur par valeur
%     On enlève la colonne i pour les comparaisons
    tempx = x;
    tempx(:, i) = [];
    
    tempy = y;
    tempy(:, i) = [];
    
    
    for j = 1:size(x, 2)-1
        
%         On vérifie que les coordonnées ne se trouvent pas dans ce
%         rectangle
    
        if (abs(x(i)-tempx(j)) < lim_height_rectangle) && (abs(y(i)-tempy(j)) < lim_width_rectangle)
            test = false;
        end
    end
    
    if test == true
        xpassed2 = [xpassed2 x(i)];
        ypassed2 = [ypassed2 y(i)];
    end
    
%     Reinitialisation du test
    test = true;
    
end
end

