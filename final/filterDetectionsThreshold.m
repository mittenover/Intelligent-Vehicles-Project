function [xpassed, ypassed] = filterDetectionsThreshold(x, y, RGYB, threshold)

xpassed = [];
ypassed = [];

for i = 1:size(x, 2)
    if (RGYB(x(i), y(i))>threshold)
        xpassed = [xpassed x(i)];
        ypassed = [ypassed y(i)];
    end
end


end