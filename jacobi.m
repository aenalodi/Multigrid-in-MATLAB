function xk=jacobi(x0, b, iter)
n=size(x0, 1)-1;
dx=1/n;
dy=dx;
xk=x0;
for k=1:iter
    for i=2:n
        for j=2:n
            xk(i, j)=(b(i, j) - (x0(i+1, j) + x0(i-1, j))/dx^2 -(x0(i, j+1) +x0(i, j-1))/dy^2) ...
                /(-2/dx^2-2/dy^2);
        end
    end
    x0=xk;
end
end