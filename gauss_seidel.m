function [x, k]=gauss_seidel(a, b, x0, n, iter)
[diag, d, l, u]=diagonally_dominant(a, n);
err=Inf;
zero=zeros(n, 1);
inv_dl=inv(d+l);
inv_dl_u=inv_dl*u;
inv_dl_b=inv_dl*b;
k=1;
x(:,1)=x0;           % Initializing X
cont=true;
while k<=iter
                                               % Finding X(k+1)
    x(:,k+1)=-inv_dl_u*x(:, k) + inv_dl_b;     % Gauss-Seidel formula
    err=x(:, k+1) - x(:, k);                   % Calculating error
    k=k+1;
end
end