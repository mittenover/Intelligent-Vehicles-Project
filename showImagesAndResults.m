function [y] = showImagesAndResults(start, stop, directory)

num = start;

nrMaxima = 15;
nbMax = nrMaxima;

boxSize = 20;
rectangleSize = 30;
threshold = 6600;

% Pour les filtrages

x_lim = 150;
y_lim = 0;

lim_height_rectangle = 30;
lim_width_rectangle  = 100;

while num <= stop
    
    AdresseImage = sprintf("%sframe_%06d.jpg", directory, num);
    MatImage = imread(AdresseImage); % Image initiale
    DoubleMatImage = double(MatImage);
    
    
    DefImage = deformatImages(DoubleMatImage); % Deformée pour ensuite être manipulée
    
    LAB = RGB2LABImage(DefImage); % to L*a*b
%     LAB = RGB2LABImage2(DefImage);

    
    RGYB = LAB2RGYBImage(LAB); % to RGYB
    [y, x, maxVals] = detectMaxima(RGYB, nrMaxima, boxSize);
    
%     Filtrage : on isole les valeurs qui dépassent un certain maximum
    [y, x] = filterDetectionsThreshold(y, x, RGYB, threshold);
    
%     Plusieurs filtrages

%   Filtrage par detection de zone
%     [y, x] = filterDetectionsMethod1(y, x, RGYB, x_lim, y_lim);
    
%     On vérifie que les maximums ne sont pas trop proches les uns des
%     autres
%     [y, x] = filterDetectionsMethod2(y, x, RGYB, lim_height_rectangle, lim_width_rectangle);
    
    nbMax = size(x, 2);
    N = size(RGYB);
   
    
    % Affichage des images
    axis equal;
    
    imagesc(MatImage);
%     for i = 1:nbMax
%         rectangle('Position', [x(i)-rectangleSize/2, y(i)-rectangleSize/2, rectangleSize, rectangleSize], 'EdgeColor', 'r');
%     end
    
%     Trace un rectangle dans la zone filtrée pas isolement d'une partie de
%     l'image.

%     rectangle('Position', [y_lim 0 N(2)-y_lim x_lim]);
        


    
%     subplot(2,2,1);
%     imagesc(MatImage);
%     for i = 1:nrMaxima
% %         rectangle('Position', [x(i)-rectangleSize/2, y(i)-rectangleSize/2, rectangleSize, rectangleSize], 'EdgeColor', 'r');
%     end
%     
%     subplot(2,2,2);
%     imagesc(LAB);
%     for i = 1:nrMaxima
% %         rectangle('Position', [x(i)-rectangleSize/2, y(i)-rectangleSize/2, rectangleSize, rectangleSize], 'EdgeColor', 'r');
%     end
%     
%     
%     subplot(2,2,3);
%     imagesc(RGYB);
%     for i = 1:nrMaxima
% %         rectangle('Position', [x(i)-rectangleSize/2, y(i)-rectangleSize/2, rectangleSize, rectangleSize], 'EdgeColor', 'r');
%     end

    
    
    hold on;
    
    w = waitforbuttonpress;
    
    if w == 1
        pause(0.001);
        hold off;
        num = num + 1;
    end
    
    if w == 0 && num > start
        hold off;
        num = num - 1;
    end
end