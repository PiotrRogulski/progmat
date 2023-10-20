function [x, v, exitflag, output] = p3

opt = optimset(...
    optimset(@linprog), ...
    Display='iter', ...
    Algorithm='interior-point');

N = 7;

% ineq coeffs
A = [
  2, 1, 0;
  1, 4, 6;
];

% 1 for <=, -1 for >=
signs = [
    -1;
    -1;
];

% ineq vals
b = [
    3*N;
    2*N
];

% target coeffs
c = [1; 1; 1];

% eq coeffs
Aeq = [];
% eq vals
beq = [];

% bounds
lower = [0, 0, 0];
upper = [inf, inf, inf];

[x, v, exitflag, output] = linprog(...
    c, ...
    A .* signs, ...
    b .* signs, ...
    Aeq, ...
    beq, ...
    lower, ...
    upper, ...
    opt);

end