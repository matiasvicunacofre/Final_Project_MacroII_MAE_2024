function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=((1-params(3))*y(13)/y(14))-(y(10)*params(8));
  T(1)=y(17)*y(6)^params(3);
  T(2)=y(14)^(1-params(3));
  residual(2)=(y(13))-(T(1)*T(2));
  residual(3)=(y(10))-(y(13)+(1-params(2))*y(6)-y(15));
  residual(4)=(1/y(10))-(params(1)*1/y(19)*(y(21)+1-params(2)));
  residual(5)=(y(12))-(params(3)*y(13)/y(6));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(-(T(2)*y(17)*getPowerDeriv(y(6),params(3),1)));
g1_v(2)=(-(1-params(2)));
g1_v(3)=(-(params(3)*(-y(13))/(y(6)*y(6))));
g1_v(4)=(1-params(3))*(-y(13))/(y(14)*y(14));
g1_v(5)=(-(T(1)*getPowerDeriv(y(14),1-params(3),1)));
g1_v(6)=(1-params(3))*1/y(14);
g1_v(7)=1;
g1_v(8)=(-1);
g1_v(9)=(-(params(3)*1/y(6)));
g1_v(10)=1;
g1_v(11)=(-params(8));
g1_v(12)=1;
g1_v(13)=(-1)/(y(10)*y(10));
g1_v(14)=1;
g1_v(15)=(-(params(1)*(y(21)+1-params(2))*(-1)/(y(19)*y(19))));
g1_v(16)=(-(params(1)*1/y(19)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 15);
end
end
