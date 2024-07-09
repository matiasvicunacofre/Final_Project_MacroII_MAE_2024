function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
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

assert(length(T) >= 9);

T(1) = y(6)^(params(8)-1);
T(2) = params(6)*y(6)^params(8)+(1-params(6))*y(7)^params(8);
T(3) = y(7)^(params(8)-1);
T(4) = y(8)^params(3);
T(5) = y(16)*T(4);
T(6) = y(10)^(1-params(3));
T(7) = y(9)^params(7);
T(8) = y(17)*T(7);
T(9) = y(11)^(1-params(7));

end
