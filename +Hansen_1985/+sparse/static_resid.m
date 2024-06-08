function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = Hansen_1985.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (1/y(1)) - (params(1)*1/y(1)*(y(3)+1-params(2)));
    residual(2) = ((1-params(3))*y(4)/y(5)) - (y(1)*params(8));
    residual(3) = (y(1)) - (y(4)+(1-params(2))*y(6)-y(6));
    residual(4) = (y(6)) - ((1-params(2))*y(6)+y(7));
    residual(5) = (y(4)) - (T(2)*T(3));
    residual(6) = (y(3)) - (params(3)*y(4)/y(6));
    residual(7) = (y(2)) - ((1-params(3))*y(4)/y(5));
    residual(8) = (log(y(8))) - (log(y(8))*params(4)+x(1));
    residual(9) = (y(9)) - (y(4)/y(5));
end
