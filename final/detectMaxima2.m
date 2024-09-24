function[x, y, maxVals] = detectMaxima(RGYB, nrMaxima, boxSize)

N = size(RGYB);

maxVals = max(max(RGYB));

[x, y] = find(RGYB == maxVals);

% Pour éviter qu'il y ait deux maxs
x = x(1);
y = y(1);

val_min = min(min(RGYB)); % On ne met pas 0 car les valeurs peuvent être toutes négatives

boxSize = int8(boxSize/2 - 0.6); % Le 0.5 ajuste la taille de boxSize

RGYB(max(x-boxSize, 1):min(x+boxSize, N(1)), max(y-boxSize, 1):min(y+boxSize, N(2))) = val_min;
%Problème de dépassement

if (nrMaxima > 1)
    [a, b, c] = detectMaxima(RGYB, nrMaxima-1, boxSize); % On itère si différent de 1

    x       = [x       a];
    y       = [y       b];
    maxVals = [maxVals c];
end
end