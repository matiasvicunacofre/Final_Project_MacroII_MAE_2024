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

assert(length(T) >= 15);

T(1) = params(6)*y(11)^(params(8)-1);
T(2) = params(6)*y(11)^params(8)+(1-params(6))*y(12)^params(8);
T(3) = T(1)/T(2);
T(4) = params(1)*y(23)^(params(8)-1);
T(5) = params(6)*y(23)^params(8)+(1-params(6))*y(24)^params(8);
T(6) = (1-params(6))*params(1)*y(24)^(params(8)-1);
T(7) = T(6)*y(18);
T(8) = (1-params(6))*y(12)^(params(8)-1);
T(9) = y(18)*T(8);
T(10) = y(2)^params(3);
T(11) = y(21)*T(10);
T(12) = y(15)^(1-params(3));
T(13) = y(3)^params(7);
T(14) = y(22)*T(13);
T(15) = y(16)^(1-params(7));

end
