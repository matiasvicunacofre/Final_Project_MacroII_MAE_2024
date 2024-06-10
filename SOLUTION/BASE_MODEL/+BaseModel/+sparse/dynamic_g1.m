function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(6, 1);
end
[T_order, T] = BaseModel.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(29, 1);
g1_v(1)=(-((1-params(5))*exp(y(3))));
g1_v(2)=(-(T(3)*exp(y(13))*exp(y(3))*getPowerDeriv(exp(y(3)),params(1),1)));
g1_v(3)=(-(params(1)*(-(exp(y(10))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
g1_v(4)=(-params(3));
g1_v(5)=(-exp(y(10)));
g1_v(6)=exp(y(10))*(1-params(1))/exp(y(15));
g1_v(7)=exp(y(10));
g1_v(8)=(-((1-params(1))*T(5)));
g1_v(9)=(-(params(1)*exp(y(10))/exp(y(3))));
g1_v(10)=(-exp(y(10)));
g1_v(11)=(-T(5));
g1_v(12)=exp(y(11));
g1_v(13)=exp(y(12));
g1_v(14)=(-T(4));
g1_v(15)=1;
g1_v(16)=exp(y(14))*getPowerDeriv(exp(y(14)),(-1),1);
g1_v(17)=exp(y(14));
g1_v(18)=(-(exp(y(14))*params(6)/(1-exp(y(15)))));
g1_v(19)=exp(y(14));
g1_v(20)=(-(exp(y(10))*(1-params(1))*exp(y(15))))/(exp(y(15))*exp(y(15)))-exp(y(14))*(-(params(6)*(-exp(y(15)))))/((1-exp(y(15)))*(1-exp(y(15))));
g1_v(21)=(-(T(2)*exp(y(15))*getPowerDeriv(exp(y(15)),1-params(1),1)));
g1_v(22)=(-((1-params(1))*T(6)));
g1_v(23)=(-T(6));
g1_v(24)=exp(y(16));
g1_v(25)=exp(y(17));
g1_v(26)=exp(y(18));
g1_v(27)=(-(params(2)*(1+exp(y(26))-params(5))*exp(y(23))*getPowerDeriv(exp(y(23)),(-1),1)));
g1_v(28)=(-(params(2)*T(1)*exp(y(26))));
g1_v(29)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 28);
end
