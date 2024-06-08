function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=((1-params(3))*y(4)/y(5))-(y(1)*params(8));
  residual(2)=(y(1))-(y(4)+(1-params(2))*y(6)-y(6));
  residual(3)=(1/y(1))-(params(1)*1/y(1)*(y(3)+1-params(2)));
  T(2)=y(8)*y(6)^params(3);
  T(3)=y(5)^(1-params(3));
  residual(4)=(y(4))-(T(2)*T(3));
  residual(5)=(y(3))-(params(3)*y(4)/y(6));
if nargout > 3
    g1_v = NaN(14, 1);
g1_v(1)=(-params(8));
g1_v(2)=1;
g1_v(3)=(-1)/(y(1)*y(1))-params(1)*(y(3)+1-params(2))*(-1)/(y(1)*y(1));
g1_v(4)=(-(1-params(2)-1));
g1_v(5)=(-(T(3)*y(8)*getPowerDeriv(y(6),params(3),1)));
g1_v(6)=(-(params(3)*(-y(4))/(y(6)*y(6))));
g1_v(7)=(-(1/y(1)*params(1)));
g1_v(8)=1;
g1_v(9)=(1-params(3))*(-y(4))/(y(5)*y(5));
g1_v(10)=(-(T(2)*getPowerDeriv(y(5),1-params(3),1)));
g1_v(11)=(1-params(3))*1/y(5);
g1_v(12)=(-1);
g1_v(13)=1;
g1_v(14)=(-(params(3)*1/y(6)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
