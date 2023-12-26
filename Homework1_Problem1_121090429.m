clear;
clc;

cvx_begin
variables x1 x2
minimize -7.8*x1 - 7.1*x2
subject to
1/8*x1 + 1/2*x2 <= 90;
1/4*x1 + 1/6*x2 <= 80;
x1 >= 0;
x2 >= 0;
cvx_end

% print outcome
x1
x2
7.8*x1 + 7.1*x2

