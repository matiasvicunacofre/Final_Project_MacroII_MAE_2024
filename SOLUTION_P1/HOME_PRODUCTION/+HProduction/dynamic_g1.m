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
    T = HProduction.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(17, 27);
g1(1,11)=T(18);
g1(1,23)=(-((T(5)*(y(25)+1-params(2))*T(19)-T(4)*(y(25)+1-params(2))*T(20))/(T(5)*T(5))));
g1(1,12)=T(22);
g1(1,24)=(-((-(T(4)*(y(25)+1-params(2))*T(23)))/(T(5)*T(5))));
g1(1,25)=(-(T(4)/T(5)));
g1(2,11)=T(18);
g1(2,23)=(-((T(5)*(1-params(2))*T(19)-T(4)*(1-params(2))*T(20))/(T(5)*T(5))+(-(T(7)*T(20)))/(T(5)*T(5))));
g1(2,12)=T(22);
g1(2,24)=(-((-(T(4)*(1-params(2))*T(23)))/(T(5)*T(5))+(T(5)*y(18)*(1-params(6))*params(1)*getPowerDeriv(y(24),params(8)-1,1)-T(7)*T(23))/(T(5)*T(5))));
g1(2,18)=(-(T(6)/T(5)));
g1(3,8)=(-params(5))/(y(8)*y(8));
g1(3,11)=(-((T(2)*y(17)*T(16)-T(1)*y(17)*T(17))/(T(2)*T(2))));
g1(3,12)=(-((-(T(1)*y(17)*T(21)))/(T(2)*T(2))));
g1(3,17)=(-T(3));
g1(4,8)=(-params(5))/(y(8)*y(8));
g1(4,11)=(-((-(T(9)*T(17)))/(T(2)*T(2))));
g1(4,12)=(-((T(2)*y(18)*(1-params(6))*getPowerDeriv(y(12),params(8)-1,1)-T(9)*T(21))/(T(2)*T(2))));
g1(4,18)=(-(T(8)/T(2)));
g1(5,9)=(-1);
g1(5,11)=1;
g1(5,2)=(-(1-params(2)));
g1(5,13)=1;
g1(6,10)=(-1);
g1(6,12)=1;
g1(7,8)=1;
g1(7,15)=1;
g1(7,16)=1;
g1(8,1)=(-(1-params(2)));
g1(8,6)=1;
g1(8,7)=(-1);
g1(9,6)=1;
g1(9,13)=(-1);
g1(9,14)=(-1);
g1(10,9)=1;
g1(10,2)=(-(T(12)*y(21)*getPowerDeriv(y(2),params(3),1)));
g1(10,15)=(-(T(11)*getPowerDeriv(y(15),1-params(3),1)));
g1(10,21)=(-(T(10)*T(12)));
g1(11,10)=1;
g1(11,3)=(-(T(15)*y(22)*getPowerDeriv(y(3),params(7),1)));
g1(11,16)=(-(T(14)*getPowerDeriv(y(16),1-params(7),1)));
g1(11,22)=(-(T(13)*T(15)));
g1(12,9)=(-(params(3)*1/y(2)));
g1(12,2)=(-(params(3)*(-y(9))/(y(2)*y(2))));
g1(12,17)=1;
g1(13,10)=(-(params(7)*1/y(3)));
g1(13,3)=(-(params(7)*(-y(10))/(y(3)*y(3))));
g1(13,18)=1;
g1(14,9)=(-((1-params(3))*1/y(15)));
g1(14,15)=(-((1-params(3))*(-y(9))/(y(15)*y(15))));
g1(14,19)=1;
g1(15,10)=(-((1-params(7))*1/y(16)));
g1(15,16)=(-((1-params(7))*(-y(10))/(y(16)*y(16))));
g1(15,20)=1;
g1(16,4)=(-(params(4)*1/y(4)));
g1(16,21)=1/y(21);
g1(16,26)=(-1);
g1(17,5)=(-(params(4)*1/y(5)));
g1(17,22)=1/y(22);
g1(17,27)=(-1);

end
