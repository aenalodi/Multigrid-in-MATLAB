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
tol=tolerance();

% Gauss-Seidel iterations
[x, k]=gauss_seidel(d, l, u, b, x0, n, tol);

disp(strcat('Iterations performed: ', num2str(k-1)));
disp('Solution vector for X:');
disp(x(:, k));