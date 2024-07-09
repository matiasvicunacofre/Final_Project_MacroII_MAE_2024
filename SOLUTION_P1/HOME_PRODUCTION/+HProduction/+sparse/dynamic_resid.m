function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(15, 1);
end
[T_order, T] = HProduction.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(17, 1);
    residual(1) = (T(3)) - (T(4)*(y(46)+1-params(2))/T(5));
    residual(2) = (T(3)) - (T(4)*(1-params(2))/T(5)+T(7)/T(5));
    residual(3) = (params(5)/y(20)) - (T(1)*y(29)/T(2));
    residual(4) = (params(5)/y(20)) - (T(9)/T(2));
    residual(5) = (y(23)) - (y(21)+(1-params(2))*y(8)-y(25));
    residual(6) = (y(24)) - (y(22));
    residual(7) = (y(20)) - (1-y(28)-y(27));
    residual(8) = (y(18)) - ((1-params(2))*y(1)+y(19));
    residual(9) = (y(18)) - (y(25)+y(26));
    residual(10) = (y(21)) - (T(11)*T(12));
    residual(11) = (y(22)) - (T(14)*T(15));
    residual(12) = (y(29)) - (params(3)*y(21)/y(8));
    residual(13) = (y(30)) - (params(7)*y(22)/y(9));
    residual(14) = (y(31)) - ((1-params(3))*y(21)/y(27));
    residual(15) = (y(32)) - ((1-params(7))*y(22)/y(28));
    residual(16) = (log(y(33))) - (params(4)*log(y(16))+x(1));
    residual(17) = (log(y(34))) - (params(4)*log(y(17))+x(2));
end
