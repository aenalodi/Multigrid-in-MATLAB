function conv_img=laplace(x)
n=size(x, 1)-1;
dx=1/n;
dy=dx;
conv_img=zeros(n+1);
conv_img(2:n, 2:n)=(x(1:n-1, 2:n)+x(3:n+1, 2:n)-2*x(2:n, 2:n))/dx^2 + (x(2:n, 1:n-1) + ...
    x(2:n, 3:n+1) - 2*x(2:n, 2:n))/dy^2;
end