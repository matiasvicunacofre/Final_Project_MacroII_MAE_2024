function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = HomeProduction.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(18, 1);
    residual(1) = (params(9)*T(1)/exp(y(4))) - (T(1)*params(9)*params(2)/exp(y(4))*(1+exp(y(14))-params(8)));
    residual(2) = (params(9)*T(2)/exp(y(4))) - (T(2)*params(2)*(1-params(9))/exp(y(4))*exp(y(13)));
    residual(3) = (exp(y(4))) - (T(3)^(1/params(7)));
    residual(4) = (exp(y(10))) - (exp(y(3))+(1-params(8))*(exp(y(10))+exp(y(9)))-exp(y(9))-exp(y(6)));
    residual(5) = (exp(y(2))) - (exp(y(5)));
    residual(6) = (exp(y(8))) - (exp(y(10))+exp(y(9)));
    residual(7) = (exp(y(3))) - (T(6));
    residual(8) = (exp(y(2))) - (T(9));
    residual(9) = (exp(y(1))) - (exp(y(3))+exp(y(2)));
    residual(10) = (exp(y(18))) - (exp(y(17))+exp(y(16)));
    residual(11) = (params(10)-exp(y(18))) - (T(10));
    residual(12) = (params(10)-exp(y(18))) - (T(11));
    residual(13) = (exp(y(7))) - (exp(y(3))-exp(y(6)));
    residual(14) = (exp(y(14))) - (params(1)*exp(y(3))/exp(y(10)));
    residual(15) = (exp(y(13))) - (params(6)*exp(y(2))/exp(y(9)));
    residual(16) = (exp(y(15))) - (exp(y(14))+exp(y(13)));
    residual(17) = (y(12)) - (y(12)*params(3)+x(2));
    residual(18) = (y(11)) - (y(11)*params(3)+x(1));
end
