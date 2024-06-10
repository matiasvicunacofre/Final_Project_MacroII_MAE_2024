function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = BaseModel.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(9, 14);
g1(1,7)=exp(y(7))*getPowerDeriv(exp(y(7)),(-1),1);
g1(1,12)=(-(params(2)*(1+exp(y(13))-params(5))*exp(y(12))*getPowerDeriv(exp(y(12)),(-1),1)));
g1(1,13)=(-(params(2)*T(1)*exp(y(13))));
g1(2,3)=(-exp(y(3)));
g1(2,1)=(-((1-params(5))*exp(y(1))));
g1(2,5)=exp(y(5));
g1(2,7)=exp(y(7));
g1(3,3)=exp(y(3))*(1-params(1))/exp(y(8));
g1(3,7)=(-(exp(y(7))*params(6)/(1-exp(y(8)))));
g1(3,8)=(-(exp(y(3))*(1-params(1))*exp(y(8))))/(exp(y(8))*exp(y(8)))-exp(y(7))*(-(params(6)*(-exp(y(8)))))/((1-exp(y(8)))*(1-exp(y(8))));
g1(4,3)=exp(y(3));
g1(4,1)=(-(T(3)*exp(y(6))*exp(y(1))*getPowerDeriv(exp(y(1)),params(1),1)));
g1(4,6)=(-T(4));
g1(4,8)=(-(T(2)*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(1),1)));
g1(5,3)=(-((1-params(1))*T(5)));
g1(5,8)=(-((1-params(1))*T(6)));
g1(5,9)=exp(y(9));
g1(6,3)=(-(params(1)*exp(y(3))/exp(y(1))));
g1(6,1)=(-(params(1)*(-(exp(y(3))*exp(y(1))))/(exp(y(1))*exp(y(1)))));
g1(6,10)=exp(y(10));
g1(7,3)=(-exp(y(3)));
g1(7,4)=exp(y(4));
g1(7,7)=exp(y(7));
g1(8,3)=(-T(5));
g1(8,8)=(-T(6));
g1(8,11)=exp(y(11));
g1(9,2)=(-params(3));
g1(9,6)=1;
g1(9,14)=(-1);

end
