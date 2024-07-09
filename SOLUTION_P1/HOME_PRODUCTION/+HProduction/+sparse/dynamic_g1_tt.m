function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = HProduction.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 23
    T = [T; NaN(23 - size(T, 1), 1)];
end
T(16) = params(6)*getPowerDeriv(y(23),params(8)-1,1);
T(17) = params(6)*getPowerDeriv(y(23),params(8),1);
T(18) = (T(2)*T(16)-T(1)*T(17))/(T(2)*T(2));
T(19) = params(1)*getPowerDeriv(y(40),params(8)-1,1);
T(20) = params(6)*getPowerDeriv(y(40),params(8),1);
T(21) = (1-params(6))*getPowerDeriv(y(24),params(8),1);
T(22) = (-(T(1)*T(21)))/(T(2)*T(2));
T(23) = (1-params(6))*getPowerDeriv(y(41),params(8),1);
end
