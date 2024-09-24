function RGYB = LAB2RGYBImage(LAB)

N = size(LAB);
RGYB = ones(N(1:2));

for i = 1:N(1)
    for j = 1:N(2)
        RGYB(i, j) = LAB(i, j, 1)*(LAB(i, j, 2) + LAB(i, j, 3));
    end
end
end
