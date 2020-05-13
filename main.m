img=input('Enter relative path to image file: ', 's');
init=input('Enter a value to fill in the initial guess vector: ');

x_orig=double(imread(img))/255;
imshow(x_orig);
n=size(x_orig, 1);
siz=256;
x=zeros(siz+2);
x_orig_coarse=x_orig(1:n/siz:n, 1:n/siz:n);
b_coarse=laplace(x_orig_coarse);

init_guess=ones(siz)*init;
x_jacobi=jacobi(init_guess, b_coarse, 200);
x_mg_10=multigrid(init_guess, b_coarse, 10);
x_mg_100=multigrid(x_jacobi, b_coarse, 100);
x_lapl=laplacian(x_mg_100);
subplot(2, 2, 1);
imshow(x_jacobi);
title('Smoothening');
subplot(2, 2, 2);
imshow(x_mg_10);
title('Multigrid without smoothening');
subplot(2, 2, 3);
imshow(x_mg_100);
title('Multigrid after smoothening');
subplot(2, 2, 4);
imshow(x_orig_coarse);
title('Original image');

figure();
imshow(b_coarse);
title('Laplacian edge detection');

figure();
subplot(1, 2, 1);
imshow(x_orig_coarse);
title('Before');
subplot(1, 2, 2);
imshow(x_mg_100);
title('After');