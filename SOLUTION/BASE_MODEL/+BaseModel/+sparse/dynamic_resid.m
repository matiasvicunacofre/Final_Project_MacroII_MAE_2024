function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = BaseModel.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (exp(y(14))^(-1)) - (params(2)*T(1)*(1+exp(y(26))-params(5)));
    residual(2) = (exp(y(12))) - (exp(y(10))+(1-params(5))*exp(y(3))-exp(y(14)));
    residual(3) = (exp(y(10))*(1-params(1))/exp(y(15))) - (exp(y(14))*params(6)/(1-exp(y(15))));
    residual(4) = (exp(y(10))) - (T(4));
    residual(5) = (exp(y(16))) - ((1-params(1))*T(5));
    residual(6) = (exp(y(17))) - (params(1)*exp(y(10))/exp(y(3)));
    residual(7) = (exp(y(11))) - (exp(y(10))-exp(y(14)));
    residual(8) = (exp(y(18))) - (T(5));
    residual(9) = (y(13)) - (params(3)*y(4)+x(1));
end
