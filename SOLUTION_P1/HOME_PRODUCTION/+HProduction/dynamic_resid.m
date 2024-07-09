function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = HProduction.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(17, 1);
    residual(1) = (T(3)) - (T(4)*(y(25)+1-params(2))/T(5));
    residual(2) = (T(3)) - (T(4)*(1-params(2))/T(5)+T(7)/T(5));
    residual(3) = (params(5)/y(8)) - (T(1)*y(17)/T(2));
    residual(4) = (params(5)/y(8)) - (T(9)/T(2));
    residual(5) = (y(11)) - (y(9)+(1-params(2))*y(2)-y(13));
    residual(6) = (y(12)) - (y(10));
    residual(7) = (y(8)) - (1-y(16)-y(15));
    residual(8) = (y(6)) - ((1-params(2))*y(1)+y(7));
    residual(9) = (y(6)) - (y(13)+y(14));
    residual(10) = (y(9)) - (T(11)*T(12));
    residual(11) = (y(10)) - (T(14)*T(15));
    residual(12) = (y(17)) - (params(3)*y(9)/y(2));
    residual(13) = (y(18)) - (params(7)*y(10)/y(3));
    residual(14) = (y(19)) - ((1-params(3))*y(9)/y(15));
    residual(15) = (y(20)) - ((1-params(7))*y(10)/y(16));
    residual(16) = (log(y(21))) - (params(4)*log(y(4))+x(it_, 1));
    residual(17) = (log(y(22))) - (params(4)*log(y(5))+x(it_, 2));

end
