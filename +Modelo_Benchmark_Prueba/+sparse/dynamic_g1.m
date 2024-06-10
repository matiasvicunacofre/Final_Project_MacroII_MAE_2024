function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = Modelo_Benchmark_Prueba.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(28, 1);
g1_v(1)=(-((-(params(4)*exp(y(13))*exp(y(2))))/(exp(y(2))*exp(y(2)))));
g1_v(2)=(-(T(4)*exp(y(14))*exp(y(2))*getPowerDeriv(exp(y(2)),params(4),1)));
g1_v(3)=(-((1-params(3))*exp(y(2))));
g1_v(4)=(-params(2));
g1_v(5)=exp(y(10))*getPowerDeriv(exp(y(10)),(-1),1);
g1_v(6)=exp(y(10))*params(6);
g1_v(7)=exp(y(10));
g1_v(8)=exp(y(11));
g1_v(9)=T(5);
g1_v(10)=(-(T(3)*exp(y(12))*getPowerDeriv(exp(y(12)),1-params(4),1)));
g1_v(11)=T(5);
g1_v(12)=(-((-(exp(y(13))*exp(y(12))))/(exp(y(12))*exp(y(12)))));
g1_v(13)=(-T(2));
g1_v(14)=(-(params(4)*exp(y(13))/exp(y(2))));
g1_v(15)=exp(y(13));
g1_v(16)=(-exp(y(13)));
g1_v(17)=(-T(2));
g1_v(18)=(-(exp(y(13))/exp(y(12))));
g1_v(19)=1;
g1_v(20)=(-(T(3)*T(4)));
g1_v(21)=1;
g1_v(22)=exp(y(16));
g1_v(23)=exp(y(17));
g1_v(24)=(-exp(y(17)));
g1_v(25)=1;
g1_v(26)=(-((y(24)+1-params(3))*params(1)*exp(y(19))*getPowerDeriv(exp(y(19)),(-1),1)));
g1_v(27)=(-T(1));
g1_v(28)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 28);
end
