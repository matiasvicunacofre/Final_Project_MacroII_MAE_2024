function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 15
    T = [T; NaN(15 - size(T, 1), 1)];
end
T(1) = params(6)*y(23)^(params(8)-1);
T(2) = params(6)*y(23)^params(8)+(1-params(6))*y(24)^params(8);
T(3) = T(1)/T(2);
T(4) = params(1)*y(40)^(params(8)-1);
T(5) = params(6)*y(40)^params(8)+(1-params(6))*y(41)^params(8);
T(6) = (1-params(6))*params(1)*y(41)^(params(8)-1);
T(7) = T(6)*y(30);
T(8) = (1-params(6))*y(24)^(params(8)-1);
T(9) = y(30)*T(8);
T(10) = y(8)^params(3);
T(11) = y(33)*T(10);
T(12) = y(27)^(1-params(3));
T(13) = y(9)^params(7);
T(14) = y(34)*T(13);
T(15) = y(28)^(1-params(7));
end
