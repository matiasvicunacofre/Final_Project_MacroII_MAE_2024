function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = Modelo_Benchmark_Prueba.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 5
    T = [T; NaN(5 - size(T, 1), 1)];
end
T(5) = (-((-((1-params(4))*exp(y(13))*exp(y(12))))/(exp(y(12))*exp(y(12)))));
end
