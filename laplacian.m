function conv_img=laplacian(img)
kernel=-1*ones(3);
kernel(2, 2)=8; % Middle value is 8
conv_img=conv2(img, kernel, 'valid');
size(conv_img)
end