function tol=tolerance()
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
end