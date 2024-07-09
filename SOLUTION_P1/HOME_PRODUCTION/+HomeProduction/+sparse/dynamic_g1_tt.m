function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = HomeProduction.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
T(14) = exp(y(23))*getPowerDeriv(exp(y(23)),params(7)-1,1);
T(15) = getPowerDeriv(T(6),1/params(7),1);
T(16) = params(9)*exp(y(24))*getPowerDeriv(exp(y(24)),params(7)-1,1)/exp(y(22));
end
