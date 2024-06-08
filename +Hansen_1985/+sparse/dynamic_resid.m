function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = Hansen_1985.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (1/y(10)) - (params(1)*1/y(19)*(y(21)+1-params(2)));
    residual(2) = ((1-params(3))*y(13)/y(14)) - (y(10)*params(8));
    residual(3) = (y(10)) - (y(13)+(1-params(2))*y(6)-y(15));
    residual(4) = (y(15)) - ((1-params(2))*y(6)+y(16));
    residual(5) = (y(13)) - (T(2)*T(3));
    residual(6) = (y(12)) - (params(3)*y(13)/y(6));
    residual(7) = (y(11)) - ((1-params(3))*y(13)/y(14));
    residual(8) = (log(y(17))) - (params(4)*log(y(8))+x(1));
    residual(9) = (y(18)) - (y(13)/y(14));
end
