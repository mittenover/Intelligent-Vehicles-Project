function LAB = RGB2LABImage2(RGB)

N = size(RGB);
LAB = ones(N);

for i = 1:N(1)
    for j = 1:N(2)
        temp = [RGB(i, j, 1) RGB(i, j, 2) RGB(i, j, 3)];
        LAB(i, j, 1:3) = RGB2LABPixel(temp);
    end
end

end