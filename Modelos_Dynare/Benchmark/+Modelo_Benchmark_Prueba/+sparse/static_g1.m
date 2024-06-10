function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(6, 1);
end
[T_order, T] = Modelo_Benchmark_Prueba.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(24, 1);
g1_v(1)=T(5)-(y(6)+1-params(3))*params(1)*T(5);
g1_v(2)=exp(y(1))*params(6);
g1_v(3)=exp(y(1));
g1_v(4)=(-((-(params(4)*exp(y(4))*exp(y(2))))/(exp(y(2))*exp(y(2)))));
g1_v(5)=(-(T(4)*exp(y(5))*exp(y(2))*getPowerDeriv(exp(y(2)),params(4),1)));
g1_v(6)=exp(y(2))-(1-params(3))*exp(y(2));
g1_v(7)=T(6);
g1_v(8)=(-(T(3)*exp(y(3))*getPowerDeriv(exp(y(3)),1-params(4),1)));
g1_v(9)=T(6);
g1_v(10)=(-((-(exp(y(4))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
g1_v(11)=(-T(2));
g1_v(12)=(-(params(4)*exp(y(4))/exp(y(2))));
g1_v(13)=exp(y(4));
g1_v(14)=(-exp(y(4)));
g1_v(15)=(-T(2));
g1_v(16)=(-(exp(y(4))/exp(y(3))));
g1_v(17)=1-params(2);
g1_v(18)=(-(T(3)*T(4)));
g1_v(19)=(-(T(1)*params(1)));
g1_v(20)=1;
g1_v(21)=exp(y(7));
g1_v(22)=exp(y(8));
g1_v(23)=(-exp(y(8)));
g1_v(24)=exp(y(9));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
