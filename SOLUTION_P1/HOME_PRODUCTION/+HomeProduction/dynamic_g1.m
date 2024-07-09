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
    T = HomeProduction.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(18, 29);
g1(1,8)=(-(T(1)*exp(y(8))))/(exp(y(8))*exp(y(8)));
g1(1,23)=(-((1+exp(y(27))-params(8))*(-(T(3)*exp(y(23))))/(exp(y(23))*exp(y(23)))));
g1(1,10)=T(16);
g1(1,25)=(-((1+exp(y(27))-params(8))*params(9)*params(2)*exp(y(25))*getPowerDeriv(exp(y(25)),params(7)-1,1)/exp(y(23))));
g1(1,27)=(-(T(3)/exp(y(23))*exp(y(27))));
g1(2,8)=(-(exp(y(8))*params(9)*T(4)))/(exp(y(8))*exp(y(8)));
g1(2,23)=(-(exp(y(26))*(-(exp(y(23))*T(5)))/(exp(y(23))*exp(y(23)))));
g1(2,9)=params(9)*T(14)/exp(y(8));
g1(2,24)=(-(exp(y(26))*params(2)*(1-params(9))*exp(y(24))*getPowerDeriv(exp(y(24)),params(7)-1,1)/exp(y(23))));
g1(2,26)=(-(T(5)/exp(y(23))*exp(y(26))));
g1(3,8)=exp(y(8));
g1(3,9)=(-((1-params(9))*exp(y(9))*getPowerDeriv(exp(y(9)),params(7),1)*T(15)));
g1(3,10)=(-(T(15)*params(9)*exp(y(10))*getPowerDeriv(exp(y(10)),params(7),1)));
g1(4,7)=(-exp(y(7)));
g1(4,10)=exp(y(10));
g1(4,1)=(-((1-params(8))*exp(y(1))));
g1(4,13)=exp(y(13));
g1(4,2)=(-((1-params(8))*exp(y(2))));
g1(4,14)=exp(y(14));
g1(5,6)=exp(y(6));
g1(5,9)=(-exp(y(9)));
g1(6,12)=exp(y(12));
g1(6,13)=(-exp(y(13)));
g1(6,14)=(-exp(y(14)));
g1(7,7)=exp(y(7));
g1(7,2)=(-(T(8)*exp(y(16))*exp(y(2))*getPowerDeriv(exp(y(2)),params(1),1)));
g1(7,16)=(-T(9));
g1(7,21)=(-(T(7)*exp(y(21))*getPowerDeriv(exp(y(21)),1-params(1),1)));
g1(8,6)=exp(y(6));
g1(8,1)=(-(T(11)*exp(y(15))*exp(y(1))*getPowerDeriv(exp(y(1)),params(6),1)));
g1(8,15)=(-T(12));
g1(8,20)=(-(T(10)*exp(y(20))*getPowerDeriv(exp(y(20)),1-params(6),1)));
g1(9,5)=exp(y(5));
g1(9,6)=(-exp(y(6)));
g1(9,7)=(-exp(y(7)));
g1(10,20)=(-exp(y(20)));
g1(10,21)=(-exp(y(21)));
g1(10,22)=exp(y(22));
g1(11,7)=(-(exp(y(7))*T(2)*(1-params(1))/exp(y(21))));
g1(11,8)=(-(exp(y(7))*(1-params(1))*(-(T(1)*exp(y(8))))/(exp(y(8))*exp(y(8)))/exp(y(21))));
g1(11,10)=(-(exp(y(7))*(1-params(1))*T(16)/exp(y(21))));
g1(11,21)=(-((-(exp(y(21))*exp(y(7))*T(2)*(1-params(1))))/(exp(y(21))*exp(y(21)))));
g1(11,22)=(-exp(y(22)));
g1(12,6)=(-T(13));
g1(12,8)=(-(exp(y(6))*(1-params(6))*(-(exp(y(8))*T(4)*(1-params(9))))/(exp(y(8))*exp(y(8)))/exp(y(20))));
g1(12,9)=(-(exp(y(6))*(1-params(6))*(1-params(9))*T(14)/exp(y(8))/exp(y(20))));
g1(12,20)=(-((-(exp(y(20))*exp(y(6))*(1-params(6))*T(4)*(1-params(9))/exp(y(8))))/(exp(y(20))*exp(y(20)))));
g1(12,22)=(-exp(y(22)));
g1(13,7)=(-exp(y(7)));
g1(13,10)=exp(y(10));
g1(13,11)=exp(y(11));
g1(14,7)=(-(params(1)*exp(y(7))/exp(y(2))));
g1(14,2)=(-(params(1)*(-(exp(y(7))*exp(y(2))))/(exp(y(2))*exp(y(2)))));
g1(14,18)=exp(y(18));
g1(15,6)=(-(params(6)*exp(y(6))/exp(y(1))));
g1(15,1)=(-(params(6)*(-(exp(y(1))*exp(y(6))))/(exp(y(1))*exp(y(1)))));
g1(15,17)=exp(y(17));
g1(16,17)=(-exp(y(17)));
g1(16,18)=(-exp(y(18)));
g1(16,19)=exp(y(19));
g1(17,4)=(-params(3));
g1(17,16)=1;
g1(17,29)=(-1);
g1(18,3)=(-params(3));
g1(18,15)=1;
g1(18,28)=(-1);

end
