function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 13
    T = [T; NaN(13 - size(T, 1), 1)];
end
T(1) = params(9)*exp(y(24))^(params(7)-1);
T(2) = T(1)/exp(y(22));
T(3) = params(9)*params(2)*exp(y(42))^(params(7)-1);
T(4) = exp(y(23))^(params(7)-1);
T(5) = params(2)*(1-params(9))*exp(y(41))^(params(7)-1);
T(6) = params(9)*exp(y(24))^params(7)+(1-params(9))*exp(y(23))^params(7);
T(7) = exp(y(30))*exp(y(10))^params(1);
T(8) = exp(y(35))^(1-params(1));
T(9) = T(7)*T(8);
T(10) = exp(y(29))*exp(y(9))^params(6);
T(11) = exp(y(34))^(1-params(6));
T(12) = T(10)*T(11);
T(13) = exp(y(20))*(1-params(6))*T(4)*(1-params(9))/exp(y(22))/exp(y(34));
end
