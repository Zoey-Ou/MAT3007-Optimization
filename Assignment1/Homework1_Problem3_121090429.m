clear;
clc;

infi = 1000; 
% set the distance between the point and itself to be a large enough number
w = [infi,5,4,infi,infi,infi,infi,infi;
    5,infi,infi,3,infi,7,infi,infi;
    4,infi,infi,infi,1,2,infi,infi;
    infi,3,infi,infi,2,infi,infi,infi;
    infi,infi,1,2,infi,infi,2,5;
    infi,7,2,infi,infi,infi,infi,3;
    infi,infi,infi,infi,2,infi,infi,1;
    infi,infi,infi,infi,5,3,1,infi]
[n,m]=size(w)

cvx_begin
    variable x(n,n);
    minimize (sum(sum(w.*x)));
    subject to
        sum(x(1,:)) - sum(x(:,1)) == 1;
        sum(x(:,n)) - sum(x(n,:)) == 1;
        for i = 2:n-1
            sum(x(i,:)) - sum(x(:,i)) == 0;
        end
        max(max(x)) <= 1
        min(min(x)) >= 0
cvx_end
x

