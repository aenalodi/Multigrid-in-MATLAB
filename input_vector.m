function b=input_vector(n)
disp('Enter values for column vector B');
b=[];
for i=1:n
    b(i)=input('');
end
b=reshape(b, n, 1);
end