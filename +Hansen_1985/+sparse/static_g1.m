function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = Hansen_1985.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(24, 1);
g1_v(1)=(-1)/(y(1)*y(1))-params(1)*(y(3)+1-params(2))*(-1)/(y(1)*y(1));
g1_v(2)=(-params(8));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=(-(1/y(1)*params(1)));
g1_v(6)=1;
g1_v(7)=(1-params(3))*1/y(5);
g1_v(8)=(-1);
g1_v(9)=1;
g1_v(10)=(-(params(3)*1/y(6)));
g1_v(11)=(-((1-params(3))*1/y(5)));
g1_v(12)=(-(1/y(5)));
g1_v(13)=(1-params(3))*(-y(4))/(y(5)*y(5));
g1_v(14)=(-(T(2)*getPowerDeriv(y(5),1-params(3),1)));
g1_v(15)=(-((1-params(3))*(-y(4))/(y(5)*y(5))));
g1_v(16)=(-((-y(4))/(y(5)*y(5))));
g1_v(17)=(-(1-params(2)-1));
g1_v(18)=1-(1-params(2));
g1_v(19)=(-(T(3)*y(8)*getPowerDeriv(y(6),params(3),1)));
g1_v(20)=(-(params(3)*(-y(4))/(y(6)*y(6))));
g1_v(21)=(-1);
g1_v(22)=(-(T(1)*T(3)));
g1_v(23)=1/y(8)-params(4)*1/y(8);
g1_v(24)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
