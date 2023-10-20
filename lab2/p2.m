function [x, v, exitflag, output] = p2

opt = optimset(...
    optimset(@linprog), ...
    Display='iter', ...
    Algorithm='interior-point');

% ineq coeffs
A = [
  -8, 7, -10, -7, -9, 4;
  9, -5, -2, -7, 2, 4;
  8, 2, -4, -2, -1, 3;
];

% 1 for <=, -1 for >=
signs = [
    -1;
    -1;
    1;
];

% ineq vals
b = [10; 9; -4];

% target coeffs
c = [-5; 7; 10; 5; -3; 2];

% eq coeffs
Aeq = [1, 1, 1, 1, 1, 1];
% eq vals
beq = 1;

% bounds
lower = [0, -inf, 0, -inf, -inf, -inf];
upper = [inf, 0, inf, inf, inf, inf];

[x, v, exitflag, output] = linprog(...
    c, ...
    A .* signs, ...
    b, ...
    Aeq, ...
    beq, ...
    lower, ...
    upper, ...
    opt);

end