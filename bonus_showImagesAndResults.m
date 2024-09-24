function [y] = bonus_showImagesAndResults(start, stop, directory)

num = start;
index = 1;


for num=start:stop
    
    AdresseImage = sprintf("%sframe_%06d.jpg", directory, num);
    MatImage = imread(AdresseImage);
    imagesc(MatImage);
    
    pause(0.001);

end