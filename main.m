clear

% Input n
n=input('Enter number of equations: ');

disp('AX=B');

% Input a
disp('Enter matrix A');
a=[];
for i=1:n
    disp(strcat('Enter values for row no.', num2str(i)));
    for j=1:n
        a(i, j)=input('');
    end
end

% Input b
disp('Enter values for column vector B');
b=[];
for i=1:n
    b(i)=input('');
end
b=reshape(b, n, 1);

% Separate matrix A into D, L, U
% and check if diagonally dominant
d=[];
u=[];
l=[];
diag=true;
for i=1:n
    sum=0;
    for j=1:i-1
        d(i, j)=0;
        u(i, j)=0;
        l(i, j)=a(i, j);
        sum=sum+a(i, j);
    end
    d(i, i)=a(i, i);
    u(i, i)=0;
    l(i, i)=0;
    for j=i+1:n
        d(i, j)=0;
        u(i, j)=a(i, j);
        l(i, j)=0;
        sum=sum+a(i, j);
    end
    if d(i, i)<sum
        diag=false;
    end
end

if diag==false
    disp('The system is not diagonally dominant, and therefore will not converge.');
    disp('Exiting ...');
    return
end

% Initial guess
x0=zeros(n, 1);
disp('Default initial guess is:');
disp(x0);
i='y';
while strcmp(i,'y') | strcmp(i,'Y')
    i=input('Would you like to enter a different initial guess? [y/n] ', 's');
    if strcmp(i,'y') | strcmp(i,'Y')
        disp('Enter values for initial guess: ');
        x0=[];
        for i=1:n
            x0(i)=input('');
        end
        x0=reshape(x0, n, 1);
        i='n';
    elseif ~strcmp(i,'n') & ~strcmp(i,'N')
        disp('Please enter y (yes) or n (no).');
        i='y';
    end
end

% Tolerance
tol=10.^-4;
disp(strcat('The default tolerance is: ', num2str(tol)));
i='y';
while strcmp(i,'y') | strcmp(i,'Y')
    i=input('Would you like to enter a different tolerance value? [y/n] ', 's');
    if strcmp(i,'y') | strcmp(i,'Y')
        tol=input('Enter tolerance: ');
        i='n';
    elseif ~strcmp(i,'n') & ~strcmp(i,'N')
        disp('Please enter y (yes) or n (no).');
        i='y';
    end
end

% Gauss-Seidel iterations
err=Inf;
zero=zeros(n, 1);
inv_dl=inv(d+l);
inv_dl_u=inv_dl*u;
inv_dl_b=inv_dl*b;
k=1;
x(:,1)=x0;           % Initializing X
while abs(err>=tol)~=zero  % Condition on error vs tolerance
                                               % Finding X(k+1)
    x(:,k+1)=-inv_dl_u*x(:, k) + inv_dl_b;     % Gauss-Seidel formula
    err=x(:, k+1) - x(:, k);                   % Calculating error
    k=k+1;
end

disp(strcat('Iterations: ', num2str(k-1)));
disp('Solution vector for X:');
disp(x(:, k));