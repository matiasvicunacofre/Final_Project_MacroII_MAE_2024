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
    T = Hansen_1985.static_g1_tt(T, y, x, params);
end
g1 = zeros(9, 9);
g1(1,1)=(-1)/(y(1)*y(1))-params(1)*(y(3)+1-params(2))*(-1)/(y(1)*y(1));
g1(1,3)=(-(1/y(1)*params(1)));
g1(2,1)=(-params(8));
g1(2,4)=(1-params(3))*1/y(5);
g1(2,5)=(1-params(3))*(-y(4))/(y(5)*y(5));
g1(3,1)=1;
g1(3,4)=(-1);
g1(3,6)=(-(1-params(2)-1));
g1(4,6)=1-(1-params(2));
g1(4,7)=(-1);
g1(5,4)=1;
g1(5,5)=(-(T(2)*getPowerDeriv(y(5),1-params(3),1)));
g1(5,6)=(-(T(3)*y(8)*getPowerDeriv(y(6),params(3),1)));
g1(5,8)=(-(T(1)*T(3)));
g1(6,3)=1;
g1(6,4)=(-(params(3)*1/y(6)));
g1(6,6)=(-(params(3)*(-y(4))/(y(6)*y(6))));
g1(7,2)=1;
g1(7,4)=(-((1-params(3))*1/y(5)));
g1(7,5)=(-((1-params(3))*(-y(4))/(y(5)*y(5))));
g1(8,8)=1/y(8)-params(4)*1/y(8);
g1(9,4)=(-(1/y(5)));
g1(9,5)=(-((-y(4))/(y(5)*y(5))));
g1(9,9)=1;

end
