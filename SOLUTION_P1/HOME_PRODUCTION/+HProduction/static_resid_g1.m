function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = HProduction.static_g1_tt(T, y, x, params);
    end
    residual = HProduction.static_resid(T, y, x, params, false);
    g1       = HProduction.static_g1(T, y, x, params, false);

end
