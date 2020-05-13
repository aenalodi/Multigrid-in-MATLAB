function x=multigrid(x0, b, iter)
for i=1:iter
    x0=jacobi(x0, b, 10);
    l_x0=laplace(x0);
    r=l_x0-b;
    n=size(r, 1);
    % Interpolating from fine to coarse
    r_coarse=r(1:2:n, 1:2:n);
    e_coarse=r_coarse*0;
    e_coarse=jacobi(e_coarse, r_coarse, 10);
    % Interpolating from coarse to fine
    e=r*0;
    e(1:2:n, 1:2:n)=e_coarse;
    e(2:2:n-1, 1:2:n)=(e(1:2:n-2, 1:2:n)+e(3:2:n, 1:2:n))/2;
    e(:, 2:2:n-1)=(e(:, 1:2:n-2)+e(:,3:2:n))/2;
    x=x0-e;
end
end