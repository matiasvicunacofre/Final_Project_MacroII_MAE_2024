%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'Modelo_Benchmark_Prueba';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e_z'};
M_.exo_names_tex(1) = {'e\_z'};
M_.exo_names_long(1) = {'e_z'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'c'};
M_.endo_names(2) = {'k'};
M_.endo_names_tex(2) = {'k'};
M_.endo_names_long(2) = {'k'};
M_.endo_names(3) = {'h'};
M_.endo_names_tex(3) = {'h'};
M_.endo_names_long(3) = {'h'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'y'};
M_.endo_names(5) = {'z'};
M_.endo_names_tex(5) = {'z'};
M_.endo_names_long(5) = {'z'};
M_.endo_names(6) = {'r'};
M_.endo_names_tex(6) = {'r'};
M_.endo_names_long(6) = {'r'};
M_.endo_names(7) = {'w'};
M_.endo_names_tex(7) = {'w'};
M_.endo_names_long(7) = {'w'};
M_.endo_names(8) = {'i'};
M_.endo_names_tex(8) = {'i'};
M_.endo_names_long(8) = {'i'};
M_.endo_names(9) = {'productividad'};
M_.endo_names_tex(9) = {'productividad'};
M_.endo_names_long(9) = {'productividad'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'rho'};
M_.param_names_tex(2) = {'rho'};
M_.param_names_long(2) = {'rho'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'theta'};
M_.param_names_tex(4) = {'theta'};
M_.param_names_long(4) = {'theta'};
M_.param_names(5) = {'sigma_e'};
M_.param_names_tex(5) = {'sigma\_e'};
M_.param_names_long(5) = {'sigma_e'};
M_.param_names(6) = {'A'};
M_.param_names_tex(6) = {'A'};
M_.param_names_long(6) = {'A'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 6;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 9;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 12;
 1 4 0;
 0 5 0;
 0 6 0;
 2 7 0;
 0 8 13;
 0 9 0;
 0 10 0;
 0 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [4; 1; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'r' ;
  4 , 'name' , 'z' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
};
M_.mapping.c.eqidx = [1 2 6 ];
M_.mapping.k.eqidx = [3 5 7 ];
M_.mapping.h.eqidx = [2 5 8 9 ];
M_.mapping.y.eqidx = [2 3 5 6 8 9 ];
M_.mapping.z.eqidx = [4 5 ];
M_.mapping.r.eqidx = [1 3 ];
M_.mapping.w.eqidx = [8 ];
M_.mapping.i.eqidx = [6 7 ];
M_.mapping.productividad.eqidx = [9 ];
M_.mapping.e_z.eqidx = [4 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 4];
M_.block_structure.block(1).variable = [ 5];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 6;
M_.block_structure.block(2).mfs = 6;
M_.block_structure.block(2).equation = [ 2 5 6 7 3 1];
M_.block_structure.block(2).variable = [ 4 3 8 2 6 1];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 18;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [4 7 8 9 10 11 12 17 18 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 9];
M_.block_structure.block(3).variable = [ 9];
M_.block_structure.block(3).is_linear = false;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(4).Simulation_Type = 3;
M_.block_structure.block(4).endo_nbr = 1;
M_.block_structure.block(4).mfs = 1;
M_.block_structure.block(4).equation = [ 8];
M_.block_structure.block(4).variable = [ 7];
M_.block_structure.block(4).is_linear = false;
M_.block_structure.block(4).NNZDerivatives = 1;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 4 5 1 2 3 5 1 2 3 4 4 5 1 3 6 6 6 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([4 4 4 7 7 7 7 8 8 9 9 10 11 12 12 12 17 18 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 4 4 4 8 10 12 13 14 17 17 17 17 17 18 19 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.variable_reordered = [ 5 4 3 8 2 6 1 9 7];
M_.block_structure.equation_reordered = [ 4 2 5 6 7 3 1 9 8];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 2;
 4 5;
 5 2;
 7 2;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 2 1;
 2 3;
 2 4;
 3 4;
 3 6;
 4 5;
 5 3;
 5 4;
 5 5;
 6 1;
 6 4;
 6 8;
 7 2;
 7 8;
 8 3;
 8 4;
 8 7;
 9 3;
 9 4;
 9 9;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 6;
];
M_.block_structure.dyn_tmp_nbr = 13;
M_.state_var = [5 2 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [28; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([3 5 7 4 1 2 6 7 2 5 8 9 2 3 5 6 8 9 4 5 3 8 6 7 9 1 1 4 ]);
M_.dynamic_g1_sparse_colval = int32([2 2 2 5 10 10 10 11 12 12 12 12 13 13 13 13 13 13 14 14 15 16 17 17 18 19 24 28 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 4 4 4 5 5 5 5 5 8 9 13 19 21 22 23 25 26 27 27 27 27 27 28 28 28 28 29 ]);
M_.lhs = {
'exp(c)^(-1)'; 
'exp(c)*A'; 
'r'; 
'z'; 
'exp(y)'; 
'exp(i)'; 
'exp(k)'; 
'exp(w)'; 
'exp(productividad)'; 
};
M_.static_tmp_nbr = [4; 2; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 4];
M_.block_structure_stat.block(1).variable = [ 5];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 6;
M_.block_structure_stat.block(2).mfs = 6;
M_.block_structure_stat.block(2).equation = [ 2 3 1 5 6 7];
M_.block_structure_stat.block(2).variable = [ 1 2 6 3 4 8];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 9];
M_.block_structure_stat.block(3).variable = [ 9];
M_.block_structure_stat.block(4).Simulation_Type = 3;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 8];
M_.block_structure_stat.block(4).variable = [ 7];
M_.block_structure_stat.variable_reordered = [ 5 1 2 6 3 4 8 9 7];
M_.block_structure_stat.equation_reordered = [ 4 2 3 1 5 6 7 9 8];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 6;
 2 1;
 2 3;
 2 4;
 3 2;
 3 4;
 3 6;
 4 5;
 5 2;
 5 3;
 5 4;
 5 5;
 6 1;
 6 4;
 6 8;
 7 2;
 7 8;
 8 3;
 8 4;
 8 7;
 9 3;
 9 4;
 9 9;
];
M_.block_structure_stat.tmp_nbr = 12;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 3 5 2 4 6 2 3 1 4 1 2 4 5 5 6 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 4 4 5 5 5 5 6 6 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 4 7 9 11 15 17 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([1 2 6 3 5 7 2 5 8 9 2 3 5 6 8 9 4 5 1 3 8 6 7 9 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 3 4 4 4 4 4 4 5 5 6 6 7 8 8 9 ]);
M_.static_g1_sparse_colptr = int32([1 4 7 11 17 19 21 22 24 25 ]);
title_string = 'Modelo de Hansen-Wright con Trabajo Divisible'
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.95;
rho = M_.params(2);
M_.params(4) = 0.36;
theta = M_.params(4);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(5) = 0.007;
sigma_e = M_.params(5);
M_.params(6) = 2;
A = M_.params(6);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(5))^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.hp_filter = 1600;
options_.irf = 20;
options_.order = 1;
options_.periods = 100000;
var_list_ = {'y';'c';'i';'k';'h';'productividad'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Modelo_Benchmark_Prueba_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
