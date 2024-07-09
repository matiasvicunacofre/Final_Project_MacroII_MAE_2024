function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 23);

T = HProduction.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(16) = params(6)*getPowerDeriv(y(11),params(8)-1,1);
T(17) = params(6)*getPowerDeriv(y(11),params(8),1);
T(18) = (T(2)*T(16)-T(1)*T(17))/(T(2)*T(2));
T(19) = params(1)*getPowerDeriv(y(23),params(8)-1,1);
T(20) = params(6)*getPowerDeriv(y(23),params(8),1);
T(21) = (1-params(6))*getPowerDeriv(y(12),params(8),1);
T(22) = (-(T(1)*T(21)))/(T(2)*T(2));
T(23) = (1-params(6))*getPowerDeriv(y(24),params(8),1);

end
