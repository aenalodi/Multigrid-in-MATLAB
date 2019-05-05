function a=input_matrix(str, n)
disp(strcat('Enter matrix: ', str));
a=[];
for i=1:n
    disp(strcat('Enter values for row no.', num2str(i)));
    for j=1:n
        a(i, j)=input('');
    end
end
end