function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 15);

T = HomeProduction.static_resid_tt(T, y, x, params);

T(12) = (-(params(9)*T(1)*exp(y(4))))/(exp(y(4))*exp(y(4)));
T(13) = exp(y(5))*getPowerDeriv(exp(y(5)),params(7)-1,1);
T(14) = getPowerDeriv(T(3),1/params(7),1);
T(15) = exp(y(6))*getPowerDeriv(exp(y(6)),params(7)-1,1);

end
