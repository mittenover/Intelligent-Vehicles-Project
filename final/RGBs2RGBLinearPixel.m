function rgbl = RGBs2RGBLinearPixel(rgb)
    T = 0.04045;
    rgbl = zeros(size(rgb, 1),size(rgb, 2));
    for i = 1:size(rgb, 1)
        for j = 1:size(rgb, 2)
            if rgb(i,j) <T
                rgbl(i,j) = rgb(i,j)/12.92; 
            else
                rgbl(i,j) = ((rgb(i,j)+0.055)/1.055)^2.4;
            end
        end
    end
end