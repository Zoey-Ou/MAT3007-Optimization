clear;
clc;

price = [0 20 13 11 28;
20 0 18 8 46;
13 18 0 9 27;
11 8 9 0 20;
28 46 27 20 0];

cvx_begin
variables x(5,5);
minimize sum(sum(price.*x));
subject to % the sum of cars that sent back and out must confirm the constraints
    x(2,1) + x(3,1) + x(4,1) + x(5,1) - x(1,2) - x(1,3) - x(1,4) - x(1,5) >= 40 ;
    x(1,2) + x(3,2) + x(4,2) + x(5,2) - x(2,1) - x(2,3) - x(2,4) - x(2,5) >= -135 ;
    x(1,3) + x(2,3) + x(4,3) + x(5,3) - x(3,1) - x(3,2) - x(3,4) - x(3,5) >= 200 ;
    x(1,4) + x(2,4) + x(3,4) + x(5,4) - x(4,1) - x(4,2) - x(4,3) - x(4,5) >= -220 ;
    x(1,5) + x(2,5) + x(3,5) + x(4,5) - x(5,1) - x(5,2) - x(5,3) - x(5,4) >= -220 ;
    x >= zeros(5,5);
cvx_end

sum(sum(price.*x))
