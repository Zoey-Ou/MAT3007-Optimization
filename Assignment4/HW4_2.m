clear;
clc;

% Homework4 Problem2 (b)
cvx_begin
variables x1 x2 x3 x4
minimize 3*x1 + 4*x2 + 8*x3 + 2*x4
subject to 
4*x1 + 6*x2 + 20*x3 + x4 >= 30;
7*x1 + 10*x2 + 30*x4 >= 40;
130*x1 + 120*x2 + 150*x3 + 70*x4 >= 400;
x1 >= 0;
x2 >= 0;
x3 >= 0;
x4 >= 0;
cvx_end

x1  % print outcome
x2
x3
x4 
3*x1 + 4*x2 + 8*x3 + 2*x4


% Homework4 Problem2 (d)
cvx_begin
variables y1 y2 y3
maximize 30*y1 + 40*y2 + 400*y3
subject to
4*y1 + 7*y2 + 130*y3 <= 3;
6*y1 + 10*y2 + 120*y3 <= 4;
20*y1 + 150*y3 <= 8;
y1 + 30*y2 + 70*y3 <= 2;
y1 >= 0;
y2 >= 0;
y3 >= 0;
cvx_end

y1 % print outcome
y2
y3
30*y1 + 40*y2 + 400*y3