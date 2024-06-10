function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = BaseModel.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(25, 1);
g1_v(1)=(-exp(y(1)));
g1_v(2)=exp(y(1))*(1-params(1))/exp(y(6));
g1_v(3)=exp(y(1));
g1_v(4)=(-((1-params(1))*T(5)));
g1_v(5)=(-(params(1)*exp(y(1))/exp(y(3))));
g1_v(6)=(-exp(y(1)));
g1_v(7)=(-T(5));
g1_v(8)=exp(y(2));
g1_v(9)=exp(y(3))-exp(y(3))*(1-params(5));
g1_v(10)=(-(T(3)*exp(y(4))*exp(y(3))*getPowerDeriv(exp(y(3)),params(1),1)));
g1_v(11)=(-(params(1)*(-(exp(y(3))*exp(y(1))))/(exp(y(3))*exp(y(3)))));
g1_v(12)=(-T(4));
g1_v(13)=1-params(3);
g1_v(14)=T(6)-params(2)*(1+exp(y(8))-params(5))*T(6);
g1_v(15)=exp(y(5));
g1_v(16)=(-(exp(y(5))*params(6)/(1-exp(y(6)))));
g1_v(17)=exp(y(5));
g1_v(18)=(-(exp(y(1))*(1-params(1))*exp(y(6))))/(exp(y(6))*exp(y(6)))-exp(y(5))*(-(params(6)*(-exp(y(6)))))/((1-exp(y(6)))*(1-exp(y(6))));
g1_v(19)=(-(T(2)*exp(y(6))*getPowerDeriv(exp(y(6)),1-params(1),1)));
g1_v(20)=(-((1-params(1))*T(7)));
g1_v(21)=(-T(7));
g1_v(22)=exp(y(7));
g1_v(23)=(-(params(2)*T(1)*exp(y(8))));
g1_v(24)=exp(y(8));
g1_v(25)=exp(y(9));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
