function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 4
    T = [T; NaN(4 - size(T, 1), 1)];
end
T(1) = params(1)*exp(y(19))^(-1);
T(2) = (1-params(4))*exp(y(13))/exp(y(12));
T(3) = exp(y(14))*exp(y(2))^params(4);
T(4) = exp(y(12))^(1-params(4));
end
