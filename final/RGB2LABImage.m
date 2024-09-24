function LAB = RGB2LABImage(RGB)

N = size(RGB);
LAB = ones(N);

% to RGB Linear

T = 0.04045;

test = (RGB < T); % Matrice dont la composante vaut 1 si le test est vérifié, 0 sinon


RGBL = test.*(RGB/12.92) + (1-test).*((RGB+0.055)/1.055).^2.4; % ~ Renvoie la matrice opposée


% to XYZ

    M = [0.4124     0.3576      0.1805;
        0.2126      0.7152      0.0722;
        0.0193     0.1192      0.9505];
    
    ImReshape = reshape(RGBL, N(1)*N(2), N(3));
    ImReshape = ImReshape*transpose(M);
    XYZ = reshape(ImReshape, N);



% to LAB

    D65white = [0.9505     1       1.0890];
    
    % Bourrin parce que j'y arrive pas:
    
    XYZN = zeros(N);
    
    XYZN(:,:,1) = XYZ(:,:,1)/D65white(1);
    XYZN(:,:,2) = XYZ(:,:,2)/D65white(2);
    XYZN(:,:,3) = XYZ(:,:,3)/D65white(3);
    
    LAB = ones(N);
    
    LAB(:, :, 1) = 116*f(XYZN(:,:,2)) - 16;
    LAB(:, :, 2) = 500*(f(XYZN(:,:,1))-f(XYZN(:,:,2)));
    LAB(:, :, 3) = 200*(f(XYZN(:,:,2))-f(XYZN(:,:,3)));
     


function nonlinearity = f(t)
    test = t>((6/29)^3);
    nonlinearity = test.*(t.^(1/3)) + (1-test).*(7.787*t+16/116);
end
% 
% function nonlinearity = f(t)
%     if t>((6/29)^3)
%         nonlinearity = t^(1/3);
%     else
%         nonlinearity  = 7.787*t+16/116;
%     end
% end



end