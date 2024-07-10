function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(13, 1);
end
[T_order, T] = HProduction.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(49, 1);
g1_v(1)=1-(1-params(2));
g1_v(2)=1;
g1_v(3)=(-1);
g1_v(4)=(-params(5))/(y(3)*y(3));
g1_v(5)=(-params(5))/(y(3)*y(3));
g1_v(6)=1;
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=(-(params(3)*1/y(8)));
g1_v(10)=(-((1-params(3))*1/y(10)));
g1_v(11)=(-1);
g1_v(12)=1;
g1_v(13)=(-(params(7)*1/y(9)));
g1_v(14)=(-((1-params(7))*1/y(11)));
g1_v(15)=(T(2)*params(6)*T(10)-params(6)*T(1)*T(11))/(T(2)*T(2))-(T(2)*(y(12)+1-params(2))*params(1)*T(10)-T(1)*params(1)*(y(12)+1-params(2))*T(11))/(T(2)*T(2));
g1_v(16)=(T(2)*params(6)*T(10)-params(6)*T(1)*T(11))/(T(2)*T(2))-((T(2)*(1-params(2))*params(1)*T(10)-T(1)*params(1)*(1-params(2))*T(11))/(T(2)*T(2))+(-((1-params(6))*params(1)*T(3)*y(13)*T(11)))/(T(2)*T(2)));
g1_v(17)=(-((T(2)*y(12)*params(6)*T(10)-params(6)*T(1)*y(12)*T(11))/(T(2)*T(2))));
g1_v(18)=(-((-(y(13)*(1-params(6))*T(3)*T(11)))/(T(2)*T(2))));
g1_v(19)=1;
g1_v(20)=(-(params(6)*T(1)*T(12)))/(T(2)*T(2))-(-(T(1)*params(1)*(y(12)+1-params(2))*T(12)))/(T(2)*T(2));
g1_v(21)=(-(params(6)*T(1)*T(12)))/(T(2)*T(2))-((-(T(1)*params(1)*(1-params(2))*T(12)))/(T(2)*T(2))+(T(2)*y(13)*(1-params(6))*params(1)*T(13)-(1-params(6))*params(1)*T(3)*y(13)*T(12))/(T(2)*T(2)));
g1_v(22)=(-((-(params(6)*T(1)*y(12)*T(12)))/(T(2)*T(2))));
g1_v(23)=(-((T(2)*y(13)*(1-params(6))*T(13)-y(13)*(1-params(6))*T(3)*T(12))/(T(2)*T(2))));
g1_v(24)=1;
g1_v(25)=(-(1-params(2)-1));
g1_v(26)=(-1);
g1_v(27)=(-(T(6)*y(16)*getPowerDeriv(y(8),params(3),1)));
g1_v(28)=(-(params(3)*(-y(4))/(y(8)*y(8))));
g1_v(29)=(-1);
g1_v(30)=(-(T(9)*y(17)*getPowerDeriv(y(9),params(7),1)));
g1_v(31)=(-(params(7)*(-y(5))/(y(9)*y(9))));
g1_v(32)=1;
g1_v(33)=(-(T(5)*getPowerDeriv(y(10),1-params(3),1)));
g1_v(34)=(-((1-params(3))*(-y(4))/(y(10)*y(10))));
g1_v(35)=1;
g1_v(36)=(-(T(8)*getPowerDeriv(y(11),1-params(7),1)));
g1_v(37)=(-((1-params(7))*(-y(5))/(y(11)*y(11))));
g1_v(38)=(-(T(1)*params(1)/T(2)));
g1_v(39)=(-(params(6)*T(1)/T(2)));
g1_v(40)=1;
g1_v(41)=(-((1-params(6))*params(1)*T(3)/T(2)));
g1_v(42)=(-((1-params(6))*T(3)/T(2)));
g1_v(43)=1;
g1_v(44)=1;
g1_v(45)=1;
g1_v(46)=(-(T(4)*T(6)));
g1_v(47)=1/y(16)-params(4)*1/y(16);
g1_v(48)=(-(T(7)*T(9)));
g1_v(49)=1/y(17)-params(4)*1/y(17);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 17, 17);
end