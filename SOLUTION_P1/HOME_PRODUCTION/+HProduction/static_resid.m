function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = HProduction.static_resid_tt(T, y, x, params);
end
residual = zeros(17, 1);
    residual(1) = (params(6)*T(1)/T(2)) - (T(1)*params(1)*(y(12)+1-params(2))/T(2));
    residual(2) = (params(6)*T(1)/T(2)) - (T(1)*params(1)*(1-params(2))/T(2)+(1-params(6))*params(1)*T(3)*y(13)/T(2));
    residual(3) = (params(5)/y(3)) - (params(6)*T(1)*y(12)/T(2));
    residual(4) = (params(5)/y(3)) - (y(13)*(1-params(6))*T(3)/T(2));
    residual(5) = (y(6)) - (y(4)+(1-params(2))*y(8)-y(8));
    residual(6) = (y(7)) - (y(5));
    residual(7) = (y(3)) - (1-y(11)-y(10));
    residual(8) = (y(1)) - ((1-params(2))*y(1)+y(2));
    residual(9) = (y(1)) - (y(8)+y(9));
    residual(10) = (y(4)) - (T(5)*T(6));
    residual(11) = (y(5)) - (T(8)*T(9));
    residual(12) = (y(12)) - (params(3)*y(4)/y(8));
    residual(13) = (y(13)) - (params(7)*y(5)/y(9));
    residual(14) = (y(14)) - ((1-params(3))*y(4)/y(10));
    residual(15) = (y(15)) - ((1-params(7))*y(5)/y(11));
    residual(16) = (log(y(16))) - (log(y(16))*params(4)+x(1));
    residual(17) = (log(y(17))) - (params(4)*log(y(17))+x(2));

end
