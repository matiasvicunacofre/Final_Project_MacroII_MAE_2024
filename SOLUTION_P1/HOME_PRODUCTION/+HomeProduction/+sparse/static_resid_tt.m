function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(1) = exp(y(6))^(params(7)-1);
T(2) = exp(y(5))^(params(7)-1);
T(3) = params(9)*exp(y(6))^params(7)+(1-params(9))*exp(y(5))^params(7);
T(4) = exp(y(12))*exp(y(10))^params(1);
T(5) = exp(y(17))^(1-params(1));
T(6) = T(4)*T(5);
T(7) = exp(y(11))*exp(y(9))^params(6);
T(8) = exp(y(16))^(1-params(6));
T(9) = T(7)*T(8);
T(10) = exp(y(3))*params(9)*T(1)/exp(y(4))*(1-params(1))/exp(y(17));
T(11) = exp(y(2))*(1-params(6))*T(2)*(1-params(9))/exp(y(4))/exp(y(16));
end
