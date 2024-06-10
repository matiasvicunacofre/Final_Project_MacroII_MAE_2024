function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = Modelo_Benchmark_Prueba.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (T(1)) - (T(1)*params(1)*(y(6)+1-params(3)));
    residual(2) = (exp(y(1))*params(6)) - (T(2));
    residual(3) = (y(6)) - (params(4)*exp(y(4))/exp(y(2)));
    residual(4) = (y(5)) - (y(5)*params(2)+x(1));
    residual(5) = (exp(y(4))) - (T(3)*T(4));
    residual(6) = (exp(y(8))) - (exp(y(4))-exp(y(1)));
    residual(7) = (exp(y(2))) - (exp(y(8))+(1-params(3))*exp(y(2)));
    residual(8) = (exp(y(7))) - (T(2));
    residual(9) = (y(9)) - (exp(y(4))/exp(y(3)));
end
