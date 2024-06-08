function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = Hansen_1985.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(29, 1);
g1_v(1)=(-(1-params(2)));
g1_v(2)=(-(1-params(2)));
g1_v(3)=(-(T(3)*y(17)*getPowerDeriv(y(6),params(3),1)));
g1_v(4)=(-(params(3)*(-y(13))/(y(6)*y(6))));
g1_v(5)=(-(params(4)*1/y(8)));
g1_v(6)=(-1)/(y(10)*y(10));
g1_v(7)=(-params(8));
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=(1-params(3))*1/y(14);
g1_v(12)=(-1);
g1_v(13)=1;
g1_v(14)=(-(params(3)*1/y(6)));
g1_v(15)=(-((1-params(3))*1/y(14)));
g1_v(16)=(-(1/y(14)));
g1_v(17)=(1-params(3))*(-y(13))/(y(14)*y(14));
g1_v(18)=(-(T(2)*getPowerDeriv(y(14),1-params(3),1)));
g1_v(19)=(-((1-params(3))*(-y(13))/(y(14)*y(14))));
g1_v(20)=(-((-y(13))/(y(14)*y(14))));
g1_v(21)=1;
g1_v(22)=1;
g1_v(23)=(-1);
g1_v(24)=(-(T(1)*T(3)));
g1_v(25)=1/y(17);
g1_v(26)=1;
g1_v(27)=(-(params(1)*(y(21)+1-params(2))*(-1)/(y(19)*y(19))));
g1_v(28)=(-(params(1)*1/y(19)));
g1_v(29)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 28);
end
