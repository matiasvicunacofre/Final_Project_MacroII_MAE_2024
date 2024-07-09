function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 13);

T(1) = params(9)*exp(y(10))^(params(7)-1);
T(2) = T(1)/exp(y(8));
T(3) = params(9)*params(2)*exp(y(25))^(params(7)-1);
T(4) = exp(y(9))^(params(7)-1);
T(5) = params(2)*(1-params(9))*exp(y(24))^(params(7)-1);
T(6) = params(9)*exp(y(10))^params(7)+(1-params(9))*exp(y(9))^params(7);
T(7) = exp(y(16))*exp(y(2))^params(1);
T(8) = exp(y(21))^(1-params(1));
T(9) = T(7)*T(8);
T(10) = exp(y(15))*exp(y(1))^params(6);
T(11) = exp(y(20))^(1-params(6));
T(12) = T(10)*T(11);
T(13) = exp(y(6))*(1-params(6))*T(4)*(1-params(9))/exp(y(8))/exp(y(20));

end
