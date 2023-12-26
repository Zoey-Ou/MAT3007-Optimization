clear;
clc;
% Homework9 Problem3 (b)
v = [2, 1, 3, 2, 1, 4, 2]; % value
w = [2, 0.5, 0.5, 0.1, 0.5, 1, 1.5]; % weight
f = [v,v];
A = [w, zeros(1,7);
    zeros(1,7), w;
    diag(ones(1,7)), diag(ones(1,7))];
b = [3,2,ones(1,7)];

% LP
[x,fval] = linprog(-f,A,b,[],[],zeros(1,14),ones(1,14));
disp(x);
disp(-fval);

% IP
[x,fval] = intlinprog(-f,1:1:14,A,b,[],[],zeros(1,14),ones(1,14));
disp(x)
disp(-fval)