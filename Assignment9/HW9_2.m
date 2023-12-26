clear;
clc;
% Homework9 Problem2 (2)
A=[1 1 0;
   0 0 1;
   1 0 1;
   0 1 1;
   0 1 0];
v=[2,1,3,2,2];
b=[1;
   2;
   3];

cvx_begin
    variable x(5,1);

    maximize v*x;
    subject to
        (A')*x<=b;
        x(:)>=0;
        x(:)<=1;
cvx_end
v*x % print outcome
x
