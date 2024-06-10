function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  T(1)=exp(y(5));
  T(2)=exp(y(3));
  T(3)=exp(y(1));
  residual(1)=(T(2))-(T(3)+T(2)*(1-params(5))-T(1));
  T(4)=exp(y(6));
  residual(2)=(T(3)*(1-params(1))/T(4))-(T(1)*params(6)/(1-T(4)));
  T(5)=exp(y(4));
  T(6)=T(5)*T(2)^params(1);
  T(7)=T(4)^(1-params(1));
  residual(3)=(T(3))-(T(6)*T(7));
  T(8)=T(1)^(-1);
  T(9)=exp(y(8));
  residual(4)=(T(8))-(params(2)*T(8)*(1+T(9)-params(5)));
  residual(5)=(T(9))-(params(1)*T(3)/T(2));
  T(10)=T(1)*getPowerDeriv(T(1),(-1),1);
if nargout > 3
    g1_v = NaN(14, 1);
g1_v(1)=T(2)-T(2)*(1-params(5));
g1_v(2)=(-(T(7)*T(5)*T(2)*getPowerDeriv(T(2),params(1),1)));
g1_v(3)=(-(params(1)*(-(T(2)*T(3)))/(T(2)*T(2))));
g1_v(4)=T(1);
g1_v(5)=(-(T(1)*params(6)/(1-T(4))));
g1_v(6)=T(10)-params(2)*(1+T(9)-params(5))*T(10);
g1_v(7)=(-(T(3)*(1-params(1))*T(4)))/(T(4)*T(4))-T(1)*(-(params(6)*(-T(4))))/((1-T(4))*(1-T(4)));
g1_v(8)=(-(T(6)*T(4)*getPowerDeriv(T(4),1-params(1),1)));
g1_v(9)=(-(params(2)*T(8)*T(9)));
g1_v(10)=T(9);
g1_v(11)=(-T(3));
g1_v(12)=T(3)*(1-params(1))/T(4);
g1_v(13)=T(3);
g1_v(14)=(-(params(1)*T(3)/T(2)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
