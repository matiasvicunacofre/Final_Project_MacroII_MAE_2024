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
    T = HomeProduction.static_resid_tt(T, y, x, params);
end
residual = zeros(18, 1);
    residual(1) = (params(9)*T(1)/exp(y(4))) - (T(1)*params(9)*params(2)/exp(y(4))*(1+exp(y(14))-params(8)));
    residual(2) = (params(9)*T(2)/exp(y(4))) - (T(2)*params(2)*(1-params(9))/exp(y(4))*exp(y(13)));
    residual(3) = (exp(y(4))) - (T(3)^(1/params(7)));
    residual(4) = (exp(y(10))) - (exp(y(3))+(1-params(8))*(exp(y(10))+exp(y(9)))-exp(y(9))-exp(y(6)));
    residual(5) = (exp(y(2))) - (exp(y(5)));
    residual(6) = (exp(y(8))) - (exp(y(10))+exp(y(9)));
    residual(7) = (exp(y(3))) - (T(6));
    residual(8) = (exp(y(2))) - (T(9));
    residual(9) = (exp(y(1))) - (exp(y(3))+exp(y(2)));
    residual(10) = (exp(y(18))) - (exp(y(17))+exp(y(16)));
    residual(11) = (params(10)-exp(y(18))) - (T(10));
    residual(12) = (params(10)-exp(y(18))) - (T(11));
    residual(13) = (exp(y(7))) - (exp(y(3))-exp(y(6)));
    residual(14) = (exp(y(14))) - (params(1)*exp(y(3))/exp(y(10)));
    residual(15) = (exp(y(13))) - (params(6)*exp(y(2))/exp(y(9)));
    residual(16) = (exp(y(15))) - (exp(y(14))+exp(y(13)));
    residual(17) = (y(12)) - (y(12)*params(3)+x(2));
    residual(18) = (y(11)) - (y(11)*params(3)+x(1));

end
