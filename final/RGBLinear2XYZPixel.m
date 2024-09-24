function xyz = RGBLinear2XYZPixel(rgbl)
    M = [0.4124     0.3576      0.1805;
        0.2126      0.7152      0.0722;
        0.0193     0.1192      0.9505];
    
    xyz = zeros(size(rgbl, 1), size(rgbl, 2), 3);
    temp = zeros(1, 3);
    for i=size(rgbl, 1)
        for j=size(rgbl, 2)
            temp = M*';
            xyz(i, j, :) = temp';
        end
    end
end