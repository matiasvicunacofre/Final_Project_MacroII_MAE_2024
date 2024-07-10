function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(12, 1);
  T(1)=exp(y(6));
  T(2)=exp(y(4));
  T(3)=exp(y(5));
  T(4)=params(9)*T(1)^params(7)+(1-params(9))*T(3)^params(7);
  residual(1)=(T(2))-(T(4)^(1/params(7)));
  T(5)=exp(y(10));
  T(6)=exp(y(3));
  T(7)=exp(y(9));
  residual(2)=(T(5))-(T(6)+(1-params(8))*(T(5)+T(7))-T(7)-T(1));
  T(8)=exp(y(2));
  residual(3)=(T(8))-(T(3));
  T(9)=T(3)^(params(7)-1);
  T(10)=exp(y(13));
  residual(4)=(params(9)*T(9)/T(2))-(T(9)*params(2)*(1-params(9))/T(2)*T(10));
  T(11)=exp(y(12));
  T(12)=T(11)*T(5)^params(1);
  T(13)=exp(y(17));
  T(14)=T(13)^(1-params(1));
  residual(5)=(T(6))-(T(12)*T(14));
  T(15)=exp(y(11));
  T(16)=T(15)*T(7)^params(6);
  T(17)=exp(y(16));
  T(18)=T(17)^(1-params(6));
  residual(6)=(T(8))-(T(16)*T(18));
  T(19)=T(1)^(params(7)-1);
  T(20)=exp(y(14));
  residual(7)=(params(9)*T(19)/T(2))-(T(19)*params(9)*params(2)/T(2)*(1+T(20)-params(8)));
  T(21)=exp(y(18));
  residual(8)=(T(21))-(T(13)+T(17));
  residual(9)=(params(10)-T(21))-(T(6)*params(9)*T(19)/T(2)*(1-params(1))/T(13));
  residual(10)=(params(10)-T(21))-(T(8)*(1-params(6))*T(9)*(1-params(9))/T(2)/T(17));
  residual(11)=(T(10))-(params(6)*T(8)/T(7));
  residual(12)=(T(20))-(params(1)*T(6)/T(5));
  T(22)=T(3)*getPowerDeriv(T(3),params(7)-1,1);
  T(23)=getPowerDeriv(T(4),1/params(7),1);
  T(24)=T(1)*getPowerDeriv(T(1),params(7)-1,1);
if nargout > 3
    g1_v = NaN(40, 1);
g1_v(1)=T(2);
g1_v(2)=(-(T(2)*params(9)*T(9)))/(T(2)*T(2))-T(10)*(-(T(2)*T(9)*params(2)*(1-params(9))))/(T(2)*T(2));
g1_v(3)=(-(params(9)*T(19)*T(2)))/(T(2)*T(2))-(1+T(20)-params(8))*(-(T(2)*T(19)*params(9)*params(2)))/(T(2)*T(2));
g1_v(4)=(-(T(6)*(1-params(1))*(-(params(9)*T(19)*T(2)))/(T(2)*T(2))/T(13)));
g1_v(5)=(-(T(8)*(1-params(6))*(-(T(2)*T(9)*(1-params(9))))/(T(2)*T(2))/T(17)));
g1_v(6)=(-(T(23)*params(9)*T(1)*getPowerDeriv(T(1),params(7),1)));
g1_v(7)=T(1);
g1_v(8)=params(9)*T(24)/T(2)-(1+T(20)-params(8))*params(9)*params(2)*T(24)/T(2);
g1_v(9)=(-(T(6)*(1-params(1))*params(9)*T(24)/T(2)/T(13)));
g1_v(10)=(-((1-params(9))*T(3)*getPowerDeriv(T(3),params(7),1)*T(23)));
g1_v(11)=(-T(3));
g1_v(12)=params(9)*T(22)/T(2)-T(10)*params(2)*(1-params(9))*T(22)/T(2);
g1_v(13)=(-(T(8)*(1-params(6))*(1-params(9))*T(22)/T(2)/T(17)));
g1_v(14)=(-(T(9)*params(2)*(1-params(9))/T(2)*T(10)));
g1_v(15)=T(10);
g1_v(16)=(-(T(12)*T(13)*getPowerDeriv(T(13),1-params(1),1)));
g1_v(17)=(-T(13));
g1_v(18)=(-((-(T(13)*T(6)*params(9)*T(19)/T(2)*(1-params(1))))/(T(13)*T(13))));
g1_v(19)=(-(T(16)*T(17)*getPowerDeriv(T(17),1-params(6),1)));
g1_v(20)=(-T(17));
g1_v(21)=(-((-(T(17)*T(8)*(1-params(6))*T(9)*(1-params(9))/T(2)))/(T(17)*T(17))));
g1_v(22)=(-(T(19)*params(9)*params(2)/T(2)*T(20)));
g1_v(23)=T(20);
g1_v(24)=T(21);
g1_v(25)=(-T(21));
g1_v(26)=(-T(21));
g1_v(27)=(-T(6));
g1_v(28)=T(6);
g1_v(29)=(-(T(6)*params(9)*T(19)/T(2)*(1-params(1))/T(13)));
g1_v(30)=(-(params(1)*T(6)/T(5)));
g1_v(31)=T(8);
g1_v(32)=T(8);
g1_v(33)=(-(T(8)*(1-params(6))*T(9)*(1-params(9))/T(2)/T(17)));
g1_v(34)=(-(params(6)*T(8)/T(7)));
g1_v(35)=(-((1-params(8))*T(7)-T(7)));
g1_v(36)=(-(T(18)*T(15)*T(7)*getPowerDeriv(T(7),params(6),1)));
g1_v(37)=(-(params(6)*(-(T(7)*T(8)))/(T(7)*T(7))));
g1_v(38)=T(5)-T(5)*(1-params(8));
g1_v(39)=(-(T(14)*T(11)*T(5)*getPowerDeriv(T(5),params(1),1)));
g1_v(40)=(-(params(1)*(-(T(5)*T(6)))/(T(5)*T(5))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 12);
end
end