function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = HProduction.static_g1_tt(T, y, x, params);
end
g1 = zeros(17, 17);
g1(1,6)=(T(2)*params(6)*T(10)-params(6)*T(1)*T(11))/(T(2)*T(2))-(T(2)*(y(12)+1-params(2))*params(1)*T(10)-T(1)*params(1)*(y(12)+1-params(2))*T(11))/(T(2)*T(2));
g1(1,7)=(-(params(6)*T(1)*T(12)))/(T(2)*T(2))-(-(T(1)*params(1)*(y(12)+1-params(2))*T(12)))/(T(2)*T(2));
g1(1,12)=(-(T(1)*params(1)/T(2)));
g1(2,6)=(T(2)*params(6)*T(10)-params(6)*T(1)*T(11))/(T(2)*T(2))-((T(2)*(1-params(2))*params(1)*T(10)-T(1)*params(1)*(1-params(2))*T(11))/(T(2)*T(2))+(-((1-params(6))*params(1)*T(3)*y(13)*T(11)))/(T(2)*T(2)));
g1(2,7)=(-(params(6)*T(1)*T(12)))/(T(2)*T(2))-((-(T(1)*params(1)*(1-params(2))*T(12)))/(T(2)*T(2))+(T(2)*y(13)*(1-params(6))*params(1)*T(13)-(1-params(6))*params(1)*T(3)*y(13)*T(12))/(T(2)*T(2)));
g1(2,13)=(-((1-params(6))*params(1)*T(3)/T(2)));
g1(3,3)=(-params(5))/(y(3)*y(3));
g1(3,6)=(-((T(2)*y(12)*params(6)*T(10)-params(6)*T(1)*y(12)*T(11))/(T(2)*T(2))));
g1(3,7)=(-((-(params(6)*T(1)*y(12)*T(12)))/(T(2)*T(2))));
g1(3,12)=(-(params(6)*T(1)/T(2)));
g1(4,3)=(-params(5))/(y(3)*y(3));
g1(4,6)=(-((-(y(13)*(1-params(6))*T(3)*T(11)))/(T(2)*T(2))));
g1(4,7)=(-((T(2)*y(13)*(1-params(6))*T(13)-y(13)*(1-params(6))*T(3)*T(12))/(T(2)*T(2))));
g1(4,13)=(-((1-params(6))*T(3)/T(2)));
g1(5,4)=(-1);
g1(5,6)=1;
g1(5,8)=(-(1-params(2)-1));
g1(6,5)=(-1);
g1(6,7)=1;
g1(7,3)=1;
g1(7,10)=1;
g1(7,11)=1;
g1(8,1)=1-(1-params(2));
g1(8,2)=(-1);
g1(9,1)=1;
g1(9,8)=(-1);
g1(9,9)=(-1);
g1(10,4)=1;
g1(10,8)=(-(T(6)*y(16)*getPowerDeriv(y(8),params(3),1)));
g1(10,10)=(-(T(5)*getPowerDeriv(y(10),1-params(3),1)));
g1(10,16)=(-(T(4)*T(6)));
g1(11,5)=1;
g1(11,9)=(-(T(9)*y(17)*getPowerDeriv(y(9),params(7),1)));
g1(11,11)=(-(T(8)*getPowerDeriv(y(11),1-params(7),1)));
g1(11,17)=(-(T(7)*T(9)));
g1(12,4)=(-(params(3)*1/y(8)));
g1(12,8)=(-(params(3)*(-y(4))/(y(8)*y(8))));
g1(12,12)=1;
g1(13,5)=(-(params(7)*1/y(9)));
g1(13,9)=(-(params(7)*(-y(5))/(y(9)*y(9))));
g1(13,13)=1;
g1(14,4)=(-((1-params(3))*1/y(10)));
g1(14,10)=(-((1-params(3))*(-y(4))/(y(10)*y(10))));
g1(14,14)=1;
g1(15,5)=(-((1-params(7))*1/y(11)));
g1(15,11)=(-((1-params(7))*(-y(5))/(y(11)*y(11))));
g1(15,15)=1;
g1(16,16)=1/y(16)-params(4)*1/y(16);
g1(17,17)=1/y(17)-params(4)*1/y(17);

end
