function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = BaseModel.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (T(1)) - (params(2)*T(1)*(1+exp(y(8))-params(5)));
    residual(2) = (exp(y(3))) - (exp(y(1))+exp(y(3))*(1-params(5))-exp(y(5)));
    residual(3) = (exp(y(1))*(1-params(1))/exp(y(6))) - (exp(y(5))*params(6)/(1-exp(y(6))));
    residual(4) = (exp(y(1))) - (T(4));
    residual(5) = (exp(y(7))) - ((1-params(1))*T(5));
    residual(6) = (exp(y(8))) - (params(1)*exp(y(1))/exp(y(3)));
    residual(7) = (exp(y(2))) - (exp(y(1))-exp(y(5)));
    residual(8) = (exp(y(9))) - (T(5));
    residual(9) = (y(4)) - (y(4)*params(3)+x(1));
end
