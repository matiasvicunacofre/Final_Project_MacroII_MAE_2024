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
    T = HomeProduction.static_g1_tt(T, y, x, params);
end
g1 = zeros(18, 18);
g1(1,4)=T(12)-(1+exp(y(14))-params(8))*(-(exp(y(4))*T(1)*params(9)*params(2)))/(exp(y(4))*exp(y(4)));
g1(1,6)=params(9)*T(15)/exp(y(4))-(1+exp(y(14))-params(8))*params(9)*params(2)*T(15)/exp(y(4));
g1(1,14)=(-(T(1)*params(9)*params(2)/exp(y(4))*exp(y(14))));
g1(2,4)=(-(exp(y(4))*params(9)*T(2)))/(exp(y(4))*exp(y(4)))-exp(y(13))*(-(exp(y(4))*T(2)*params(2)*(1-params(9))))/(exp(y(4))*exp(y(4)));
g1(2,5)=params(9)*T(13)/exp(y(4))-exp(y(13))*params(2)*(1-params(9))*T(13)/exp(y(4));
g1(2,13)=(-(T(2)*params(2)*(1-params(9))/exp(y(4))*exp(y(13))));
g1(3,4)=exp(y(4));
g1(3,5)=(-((1-params(9))*exp(y(5))*getPowerDeriv(exp(y(5)),params(7),1)*T(14)));
g1(3,6)=(-(T(14)*params(9)*exp(y(6))*getPowerDeriv(exp(y(6)),params(7),1)));
g1(4,3)=(-exp(y(3)));
g1(4,6)=exp(y(6));
g1(4,9)=(-((1-params(8))*exp(y(9))-exp(y(9))));
g1(4,10)=exp(y(10))-exp(y(10))*(1-params(8));
g1(5,2)=exp(y(2));
g1(5,5)=(-exp(y(5)));
g1(6,8)=exp(y(8));
g1(6,9)=(-exp(y(9)));
g1(6,10)=(-exp(y(10)));
g1(7,3)=exp(y(3));
g1(7,10)=(-(T(5)*exp(y(12))*exp(y(10))*getPowerDeriv(exp(y(10)),params(1),1)));
g1(7,12)=(-T(6));
g1(7,17)=(-(T(4)*exp(y(17))*getPowerDeriv(exp(y(17)),1-params(1),1)));
g1(8,2)=exp(y(2));
g1(8,9)=(-(T(8)*exp(y(11))*exp(y(9))*getPowerDeriv(exp(y(9)),params(6),1)));
g1(8,11)=(-T(9));
g1(8,16)=(-(T(7)*exp(y(16))*getPowerDeriv(exp(y(16)),1-params(6),1)));
g1(9,1)=exp(y(1));
g1(9,2)=(-exp(y(2)));
g1(9,3)=(-exp(y(3)));
g1(10,16)=(-exp(y(16)));
g1(10,17)=(-exp(y(17)));
g1(10,18)=exp(y(18));
g1(11,3)=(-T(10));
g1(11,4)=(-(exp(y(3))*(1-params(1))*T(12)/exp(y(17))));
g1(11,6)=(-(exp(y(3))*(1-params(1))*params(9)*T(15)/exp(y(4))/exp(y(17))));
g1(11,17)=(-((-(exp(y(17))*exp(y(3))*params(9)*T(1)/exp(y(4))*(1-params(1))))/(exp(y(17))*exp(y(17)))));
g1(11,18)=(-exp(y(18)));
g1(12,2)=(-T(11));
g1(12,4)=(-(exp(y(2))*(1-params(6))*(-(exp(y(4))*T(2)*(1-params(9))))/(exp(y(4))*exp(y(4)))/exp(y(16))));
g1(12,5)=(-(exp(y(2))*(1-params(6))*(1-params(9))*T(13)/exp(y(4))/exp(y(16))));
g1(12,16)=(-((-(exp(y(16))*exp(y(2))*(1-params(6))*T(2)*(1-params(9))/exp(y(4))))/(exp(y(16))*exp(y(16)))));
g1(12,18)=(-exp(y(18)));
g1(13,3)=(-exp(y(3)));
g1(13,6)=exp(y(6));
g1(13,7)=exp(y(7));
g1(14,3)=(-(params(1)*exp(y(3))/exp(y(10))));
g1(14,10)=(-(params(1)*(-(exp(y(10))*exp(y(3))))/(exp(y(10))*exp(y(10)))));
g1(14,14)=exp(y(14));
g1(15,2)=(-(params(6)*exp(y(2))/exp(y(9))));
g1(15,9)=(-(params(6)*(-(exp(y(9))*exp(y(2))))/(exp(y(9))*exp(y(9)))));
g1(15,13)=exp(y(13));
g1(16,13)=(-exp(y(13)));
g1(16,14)=(-exp(y(14)));
g1(16,15)=exp(y(15));
g1(17,12)=1-params(3);
g1(18,11)=1-params(3);

end
