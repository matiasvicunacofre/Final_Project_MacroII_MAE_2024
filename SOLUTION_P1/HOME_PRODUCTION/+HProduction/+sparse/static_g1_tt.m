function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = HProduction.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 13
    T = [T; NaN(13 - size(T, 1), 1)];
end
T(10) = getPowerDeriv(y(6),params(8)-1,1);
T(11) = params(6)*getPowerDeriv(y(6),params(8),1);
T(12) = (1-params(6))*getPowerDeriv(y(7),params(8),1);
T(13) = getPowerDeriv(y(7),params(8)-1,1);
end
