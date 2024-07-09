function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = HomeProduction.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 15
    T = [T; NaN(15 - size(T, 1), 1)];
end
T(12) = (-(params(9)*T(1)*exp(y(4))))/(exp(y(4))*exp(y(4)));
T(13) = exp(y(5))*getPowerDeriv(exp(y(5)),params(7)-1,1);
T(14) = getPowerDeriv(T(3),1/params(7),1);
T(15) = exp(y(6))*getPowerDeriv(exp(y(6)),params(7)-1,1);
end
