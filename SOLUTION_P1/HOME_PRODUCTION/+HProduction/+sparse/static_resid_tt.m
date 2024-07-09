function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 9
    T = [T; NaN(9 - size(T, 1), 1)];
end
T(1) = y(6)^(params(8)-1);
T(2) = params(6)*y(6)^params(8)+(1-params(6))*y(7)^params(8);
T(3) = y(7)^(params(8)-1);
T(4) = y(8)^params(3);
T(5) = y(16)*T(4);
T(6) = y(10)^(1-params(3));
T(7) = y(9)^params(7);
T(8) = y(17)*T(7);
T(9) = y(11)^(1-params(7));
end
