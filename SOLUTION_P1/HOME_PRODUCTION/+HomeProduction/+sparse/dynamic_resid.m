function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(13, 1);
end
[T_order, T] = HomeProduction.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(18, 1);
    residual(1) = (T(2)) - (T(3)/exp(y(40))*(1+exp(y(50))-params(8)));
    residual(2) = (params(9)*T(4)/exp(y(22))) - (T(5)/exp(y(40))*exp(y(49)));
    residual(3) = (exp(y(22))) - (T(6)^(1/params(7)));
    residual(4) = (exp(y(28))) - (exp(y(21))+(1-params(8))*(exp(y(10))+exp(y(9)))-exp(y(27))-exp(y(24)));
    residual(5) = (exp(y(20))) - (exp(y(23)));
    residual(6) = (exp(y(26))) - (exp(y(28))+exp(y(27)));
    residual(7) = (exp(y(21))) - (T(9));
    residual(8) = (exp(y(20))) - (T(12));
    residual(9) = (exp(y(19))) - (exp(y(21))+exp(y(20)));
    residual(10) = (exp(y(36))) - (exp(y(35))+exp(y(34)));
    residual(11) = (params(10)-exp(y(36))) - (exp(y(21))*T(2)*(1-params(1))/exp(y(35)));
    residual(12) = (params(10)-exp(y(36))) - (T(13));
    residual(13) = (exp(y(25))) - (exp(y(21))-exp(y(24)));
    residual(14) = (exp(y(32))) - (params(1)*exp(y(21))/exp(y(10)));
    residual(15) = (exp(y(31))) - (params(6)*exp(y(20))/exp(y(9)));
    residual(16) = (exp(y(33))) - (exp(y(32))+exp(y(31)));
    residual(17) = (y(30)) - (params(3)*y(12)+x(2));
    residual(18) = (y(29)) - (params(3)*y(11)+x(1));
end
