function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = Modelo_Benchmark_Prueba.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (exp(y(10))^(-1)) - (T(1)*(y(24)+1-params(3)));
    residual(2) = (exp(y(10))*params(6)) - (T(2));
    residual(3) = (y(15)) - (params(4)*exp(y(13))/exp(y(2)));
    residual(4) = (y(14)) - (params(2)*y(5)+x(1));
    residual(5) = (exp(y(13))) - (T(3)*T(4));
    residual(6) = (exp(y(17))) - (exp(y(13))-exp(y(10)));
    residual(7) = (exp(y(11))) - (exp(y(17))+(1-params(3))*exp(y(2)));
    residual(8) = (exp(y(16))) - (T(2));
    residual(9) = (exp(y(18))) - (exp(y(13))/exp(y(12)));
end
