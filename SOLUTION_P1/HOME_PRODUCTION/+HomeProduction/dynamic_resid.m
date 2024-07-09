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
    T = HomeProduction.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(18, 1);
    residual(1) = (T(2)) - (T(3)/exp(y(23))*(1+exp(y(27))-params(8)));
    residual(2) = (params(9)*T(4)/exp(y(8))) - (T(5)/exp(y(23))*exp(y(26)));
    residual(3) = (exp(y(8))) - (T(6)^(1/params(7)));
    residual(4) = (exp(y(14))) - (exp(y(7))+(1-params(8))*(exp(y(2))+exp(y(1)))-exp(y(13))-exp(y(10)));
    residual(5) = (exp(y(6))) - (exp(y(9)));
    residual(6) = (exp(y(12))) - (exp(y(14))+exp(y(13)));
    residual(7) = (exp(y(7))) - (T(9));
    residual(8) = (exp(y(6))) - (T(12));
    residual(9) = (exp(y(5))) - (exp(y(7))+exp(y(6)));
    residual(10) = (exp(y(22))) - (exp(y(21))+exp(y(20)));
    residual(11) = (params(10)-exp(y(22))) - (exp(y(7))*T(2)*(1-params(1))/exp(y(21)));
    residual(12) = (params(10)-exp(y(22))) - (T(13));
    residual(13) = (exp(y(11))) - (exp(y(7))-exp(y(10)));
    residual(14) = (exp(y(18))) - (params(1)*exp(y(7))/exp(y(2)));
    residual(15) = (exp(y(17))) - (params(6)*exp(y(6))/exp(y(1)));
    residual(16) = (exp(y(19))) - (exp(y(18))+exp(y(17)));
    residual(17) = (y(16)) - (params(3)*y(4)+x(it_, 2));
    residual(18) = (y(15)) - (params(3)*y(3)+x(it_, 1));

end
