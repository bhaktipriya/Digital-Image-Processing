a = rand(200);

% Create a logical image that defines a rectangular boundary.
mask = false(size(a));
mask(10:100,10:100) = true;

figure,imshow(mask);
% Assign a fill value of 40 to all pixels within the boundary
a(mask) = 40;
figure, imagesc(a);  
