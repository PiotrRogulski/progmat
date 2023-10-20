function [x, v, exitflag, output] = p4

opt = optimset(...
    optimset(@linprog), ...
    Display='iter', ...
    Algorithm='dual-simplex');

% ineq coeffs
A = [
    1, 1, 0, 0, 0, 0;
    0, 1, 1, 0, 0, 0;
    0, 0, 1, 1, 0, 0;
    0, 0, 0, 1, 1, 0;
    0, 0, 0, 0, 1, 1;
    1, 0, 0, 0, 0, 1;
];

% 1 for <=, -1 for >=
signs = [
    -1;
    -1;
    -1;
    -1;
    -1;
    -1;
];

% ineq vals
b = [
    4;
    18;
    7;
    15;
    18;
    6;
];

% target coeffs
c = [
    1;
    1;
    1;
    1;
    1;
    1;
];

% eq coeffs
Aeq = [];
% eq vals
beq = [];

% bounds
bounds = [
    % lower
    0, 0, 0, 0, 0, 0;
    % upper
    inf, inf, inf, inf, inf, inf;
];

[x, v, exitflag, output] = linprog(...
    c, ...
    A .* signs, ...
    b .* signs, ...
    Aeq, ...
    beq, ...
    bounds(1, :), ...
    bounds(2, :), ...
    opt);

end