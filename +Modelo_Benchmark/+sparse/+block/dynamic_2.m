function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(1)=exp(y(10));
  T(2)=exp(y(13)/y(12));
  T(3)=exp(1-y(12));
  residual(1)=((1-params(4))*T(2))-(T(1)*params(6)/T(3));
  T(4)=exp(y(13));
  T(5)=exp(y(2));
  T(6)=exp(y(14));
  T(7)=T(6)*T(5)^params(4);
  T(8)=exp(y(12));
  T(9)=T(8)^(1-params(4));
  residual(2)=(T(4))-(T(7)*T(9));
  T(10)=exp(y(17));
  residual(3)=(T(10))-(T(4)-T(1));
  T(11)=exp(y(11));
  residual(4)=(T(11))-(T(10)+(1-params(3))*T(5));
  residual(5)=(y(15))-(params(4)*T(4)/T(5));
  T(12)=exp(y(19));
  T(13)=params(1)*T(12)^(-1);
  residual(6)=(T(1)^(-1))-(T(13)*(y(24)+1-params(3)));
if nargout > 3
    g1_v = NaN(18, 1);
g1_v(1)=(-(T(9)*T(6)*T(5)*getPowerDeriv(T(5),params(4),1)));
g1_v(2)=(-((1-params(3))*T(5)));
g1_v(3)=(-(params(4)*(-(T(4)*T(5)))/(T(5)*T(5))));
g1_v(4)=(1-params(4))*T(2)*1/y(12);
g1_v(5)=T(4);
g1_v(6)=(-T(4));
g1_v(7)=(-(params(4)*T(4)/T(5)));
g1_v(8)=(1-params(4))*T(2)*(-y(13))/(y(12)*y(12))-T(1)*(-(params(6)*(-T(3))))/(T(3)*T(3));
g1_v(9)=(-(T(7)*T(8)*getPowerDeriv(T(8),1-params(4),1)));
g1_v(10)=T(10);
g1_v(11)=(-T(10));
g1_v(12)=T(11);
g1_v(13)=1;
g1_v(14)=(-(T(1)*params(6)/T(3)));
g1_v(15)=T(1);
g1_v(16)=T(1)*getPowerDeriv(T(1),(-1),1);
g1_v(17)=(-T(13));
g1_v(18)=(-((y(24)+1-params(3))*params(1)*T(12)*getPowerDeriv(T(12),(-1),1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
