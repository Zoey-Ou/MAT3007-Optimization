clear;
clc;

% Homework7 Problem3 (b)
cvx_begin
variables x1 x2 x3 x4 M
minimize -x1 - x2 + M
subject to 
M >= x3;  % M = max{x3,x4}
M >= x4;
(x1 - x2)^(2) + (x3 + 2*x4)^(4) <= 5;
x1 + 2*x2 + x3 + 2*x4 <= 6;
x1 >= 0;
x2 >= 0;
x3 >= 0;
x4 >= 0;
cvx_end

x1  % print outcome
x2
x3
x4 
-x1 - x2 + M