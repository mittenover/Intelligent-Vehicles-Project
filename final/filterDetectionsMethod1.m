function [xpassed, ypassed] = filterDetectionsMethod1(x, y, RGYB, x_lim, y_lim)

% On isole une zone en haut à droite de l'image, c'est à dire
% à l'endroit où les feux se trouvent en temps normal lors de la conduite.

xpassed = [];
ypassed = [];

for i = 1:size(x, 2)
    if  (x(i)<x_lim && y(i)>y_lim)
        xpassed = [xpassed x(i)];
        ypassed = [ypassed y(i)];
    end
end

% xmethod1 = xpassed
end
