function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  T(1)=exp(y(14));
  T(2)=exp(y(10));
  T(3)=exp(y(15));
  residual(1)=(T(2)*(1-params(1))/T(3))-(T(1)*params(6)/(1-T(3)));
  T(4)=exp(y(3));
  T(5)=exp(y(13));
  T(6)=T(5)*T(4)^params(1);
  T(7)=T(3)^(1-params(1));
  residual(2)=(T(2))-(T(6)*T(7));
  T(8)=exp(y(12));
  residual(3)=(T(8))-(T(2)+(1-params(5))*T(4)-T(1));
  T(9)=exp(y(23));
  T(10)=T(9)^(-1);
  T(11)=exp(y(26));
  T(12)=1+T(11)-params(5);
  residual(4)=(T(1)^(-1))-(params(2)*T(10)*T(12));
  T(13)=exp(y(17));
  residual(5)=(T(13))-(params(1)*T(2)/T(4));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(-(T(7)*T(5)*T(4)*getPowerDeriv(T(4),params(1),1)));
g1_v(2)=(-((1-params(5))*T(4)));
g1_v(3)=(-(params(1)*(-(T(2)*T(4)))/(T(4)*T(4))));
g1_v(4)=T(2)*(1-params(1))/T(3);
g1_v(5)=T(2);
g1_v(6)=(-T(2));
g1_v(7)=(-(params(1)*T(2)/T(4)));
g1_v(8)=(-(T(2)*(1-params(1))*T(3)))/(T(3)*T(3))-T(1)*(-(params(6)*(-T(3))))/((1-T(3))*(1-T(3)));
g1_v(9)=(-(T(6)*T(3)*getPowerDeriv(T(3),1-params(1),1)));
g1_v(10)=T(8);
g1_v(11)=(-(T(1)*params(6)/(1-T(3))));
g1_v(12)=T(1);
g1_v(13)=T(1)*getPowerDeriv(T(1),(-1),1);
g1_v(14)=T(13);
g1_v(15)=(-(params(2)*T(12)*T(9)*getPowerDeriv(T(9),(-1),1)));
g1_v(16)=(-(params(2)*T(10)*T(11)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 15);
end
end
