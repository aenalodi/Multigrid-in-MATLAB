function x0=initial_guess(n)
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
end