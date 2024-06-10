function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 5
    T = [T; NaN(5 - size(T, 1), 1)];
end
T(1) = exp(y(5))^(-1);
T(2) = exp(y(4))*exp(y(3))^params(1);
T(3) = exp(y(6))^(1-params(1));
T(4) = T(2)*T(3);
T(5) = exp(y(1))/exp(y(6));
end
