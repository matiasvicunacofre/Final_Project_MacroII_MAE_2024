function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(1)=exp(y(1));
  T(2)=exp(y(4)/y(3));
  T(3)=exp(1-y(3));
  T(4)=T(1)*params(6)/T(3);
  residual(1)=((1-params(4))*T(2))-(T(4));
  T(5)=exp(y(4));
  T(6)=exp(y(2));
  residual(2)=(y(6))-(params(4)*T(5)/T(6));
  T(7)=T(1)^(-1);
  residual(3)=(T(7))-(T(7)*params(1)*(y(6)+1-params(3)));
  T(8)=exp(y(5));
  T(9)=T(8)*T(6)^params(4);
  T(10)=exp(y(3));
  T(11)=T(10)^(1-params(4));
  residual(4)=(T(5))-(T(9)*T(11));
  T(12)=exp(y(8));
  residual(5)=(T(12))-(T(5)-T(1));
  residual(6)=(T(6))-(T(12)+(1-params(3))*T(6));
  T(13)=T(1)*getPowerDeriv(T(1),(-1),1);
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(-T(4));
g1_v(2)=T(13)-(y(6)+1-params(3))*params(1)*T(13);
g1_v(3)=T(1);
g1_v(4)=(-(params(4)*(-(T(5)*T(6)))/(T(6)*T(6))));
g1_v(5)=(-(T(11)*T(8)*T(6)*getPowerDeriv(T(6),params(4),1)));
g1_v(6)=T(6)-(1-params(3))*T(6);
g1_v(7)=1;
g1_v(8)=(-(T(7)*params(1)));
g1_v(9)=(1-params(4))*T(2)*(-y(4))/(y(3)*y(3))-T(1)*(-(params(6)*(-T(3))))/(T(3)*T(3));
g1_v(10)=(-(T(9)*T(10)*getPowerDeriv(T(10),1-params(4),1)));
g1_v(11)=(1-params(4))*T(2)*1/y(3);
g1_v(12)=(-(params(4)*T(5)/T(6)));
g1_v(13)=T(5);
g1_v(14)=(-T(5));
g1_v(15)=T(12);
g1_v(16)=(-T(12));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
