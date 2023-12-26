clear;
clc;

% Homework4 Problem4 (a)
w=[0 8 7 0;
   0 0 2 4;
   0 0 0 12;
   0 0 0 0];

cvx_begin
    variable x(4,5);

    maximize sum(x(:,5));
    subject to
        sum(x(2,1:4))-sum(x(1:4,2))==0;
        sum(x(3,1:4))-sum(x(1:4,3))==0;
        sum(x(1:4,1))-sum(x(1,1:4))+sum(x(:,5))==0;
        sum(x(1:4,4))-sum(x(4,1:4))-sum(x(:,5))==0;
        x>=0;
        for i = 1:4
            for j=1:4
                x(i,j)<=w(i,j)
            end
        end
cvx_end
x,sum(x(:,5)) % print outcome


% Homework4 Problem4 (b)
cvx_begin
    variable z(4,4);
    variable y(4);
    minimize sum(sum(w.*z));
    for i = 1:4
        for j = 1:4
            if w(i,j)~=0
                z(i,j)>=y(i)-y(j)
            end
        end
    end
    y(1)-y(4)==1
    z>=0

cvx_end
z,y % print outcome
