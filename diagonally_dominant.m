function [diag, d, l, u]=diagonally_dominant(a, n)
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
end