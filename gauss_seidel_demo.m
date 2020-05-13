% Input n
n=input('Enter number of equations: ');

disp('AX=B');

% Input a
a=input_matrix('A', n);

% Separate matrix A into D, L, U
% and check if diagonally dominant
[diag, d, l, u]=diagonally_dominant(a, n);

if diag==false
    disp('The system is not diagonally dominant, and therefore will not converge.');
    disp('Exiting ...');
    return
end

% Input b
b=input_vector(n);

% Initial guess
x0=initial_guess(n);

% Tolerance
% tol=tolerance();

% Number of iterations
iter=input('Enter number of iterations to perform: ');

% Gauss-Seidel iterations
[x, k]=gauss_seidel(a, b, x0, n, iter);

disp(strcat('Iterations performed: ', num2str(k-1)));
disp('Solution vector for X:');
disp(x(:, k));