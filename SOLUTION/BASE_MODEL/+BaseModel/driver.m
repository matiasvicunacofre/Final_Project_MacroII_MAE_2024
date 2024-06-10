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
M_.fname = 'BaseModel';
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
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'I'};
M_.endo_names_tex(2) = {'I'};
M_.endo_names_long(2) = {'I'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'k'};
M_.endo_names(4) = {'z'};
M_.endo_names_tex(4) = {'z'};
M_.endo_names_long(4) = {'z'};
M_.endo_names(5) = {'c'};
M_.endo_names_tex(5) = {'c'};
M_.endo_names_long(5) = {'c'};
M_.endo_names(6) = {'h'};
M_.endo_names_tex(6) = {'h'};
M_.endo_names_long(6) = {'h'};
M_.endo_names(7) = {'w'};
M_.endo_names_tex(7) = {'w'};
M_.endo_names_long(7) = {'w'};
M_.endo_names(8) = {'r'};
M_.endo_names_tex(8) = {'r'};
M_.endo_names_long(8) = {'r'};
M_.endo_names(9) = {'prod'};
M_.endo_names_tex(9) = {'prod'};
M_.endo_names_long(9) = {'prod'};
M_.endo_partitions = struct();
M_.param_names = cell(15,1);
M_.param_names_tex = cell(15,1);
M_.param_names_long = cell(15,1);
M_.param_names(1) = {'theta'};
M_.param_names_tex(1) = {'theta'};
M_.param_names_long(1) = {'theta'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'beta'};
M_.param_names_long(2) = {'beta'};
M_.param_names(3) = {'rho'};
M_.param_names_tex(3) = {'rho'};
M_.param_names_long(3) = {'rho'};
M_.param_names(4) = {'sigmae'};
M_.param_names_tex(4) = {'sigmae'};
M_.param_names_long(4) = {'sigmae'};
M_.param_names(5) = {'delta'};
M_.param_names_tex(5) = {'delta'};
M_.param_names_long(5) = {'delta'};
M_.param_names(6) = {'A'};
M_.param_names_tex(6) = {'A'};
M_.param_names_long(6) = {'A'};
M_.param_names(7) = {'zss'};
M_.param_names_tex(7) = {'zss'};
M_.param_names_long(7) = {'zss'};
M_.param_names(8) = {'yss'};
M_.param_names_tex(8) = {'yss'};
M_.param_names_long(8) = {'yss'};
M_.param_names(9) = {'css'};
M_.param_names_tex(9) = {'css'};
M_.param_names_long(9) = {'css'};
M_.param_names(10) = {'Iss'};
M_.param_names_tex(10) = {'Iss'};
M_.param_names_long(10) = {'Iss'};
M_.param_names(11) = {'kss'};
M_.param_names_tex(11) = {'kss'};
M_.param_names_long(11) = {'kss'};
M_.param_names(12) = {'hss'};
M_.param_names_tex(12) = {'hss'};
M_.param_names_long(12) = {'hss'};
M_.param_names(13) = {'rss'};
M_.param_names_tex(13) = {'rss'};
M_.param_names_long(13) = {'rss'};
M_.param_names(14) = {'wss'};
M_.param_names_tex(14) = {'wss'};
M_.param_names_long(14) = {'wss'};
M_.param_names(15) = {'prodss'};
M_.param_names_tex(15) = {'prodss'};
M_.param_names_long(15) = {'prodss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 15;
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
 0 3 0;
 0 4 0;
 1 5 0;
 2 6 0;
 0 7 12;
 0 8 0;
 0 9 0;
 0 10 13;
 0 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [5; 1; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'z' ;
};
M_.mapping.y.eqidx = [2 3 4 5 6 7 8 ];
M_.mapping.I.eqidx = [7 ];
M_.mapping.k.eqidx = [2 4 6 ];
M_.mapping.z.eqidx = [4 9 ];
M_.mapping.c.eqidx = [1 2 3 7 ];
M_.mapping.h.eqidx = [3 4 5 8 ];
M_.mapping.w.eqidx = [5 ];
M_.mapping.r.eqidx = [1 6 ];
M_.mapping.prod.eqidx = [8 ];
M_.mapping.e.eqidx = [9 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 9];
M_.block_structure.block(1).variable = [ 4];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 5;
M_.block_structure.block(2).mfs = 5;
M_.block_structure.block(2).equation = [ 3 4 2 1 6];
M_.block_structure.block(2).variable = [ 1 6 3 5 8];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 16;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [3 6 7 8 9 10 14 15 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 8];
M_.block_structure.block(3).variable = [ 9];
M_.block_structure.block(3).is_linear = false;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(4).Simulation_Type = 3;
M_.block_structure.block(4).endo_nbr = 1;
M_.block_structure.block(4).mfs = 1;
M_.block_structure.block(4).equation = [ 7];
M_.block_structure.block(4).variable = [ 2];
M_.block_structure.block(4).is_linear = false;
M_.block_structure.block(4).NNZDerivatives = 1;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(5).Simulation_Type = 3;
M_.block_structure.block(5).endo_nbr = 1;
M_.block_structure.block(5).mfs = 1;
M_.block_structure.block(5).equation = [ 5];
M_.block_structure.block(5).variable = [ 7];
M_.block_structure.block(5).is_linear = false;
M_.block_structure.block(5).NNZDerivatives = 1;
M_.block_structure.block(5).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 3 5 1 2 3 5 1 2 3 1 3 4 5 4 4 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([3 3 3 6 6 6 6 7 7 8 9 9 9 10 14 15 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 4 4 4 8 10 11 14 15 15 15 15 16 17 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.variable_reordered = [ 4 1 6 3 5 8 9 2 7];
M_.block_structure.equation_reordered = [ 9 3 4 2 1 6 8 7 5];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 2 3;
 4 3;
 6 3;
 9 4;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 5;
 2 1;
 2 3;
 2 5;
 3 1;
 3 5;
 3 6;
 4 1;
 4 4;
 4 6;
 5 1;
 5 6;
 5 7;
 6 1;
 6 8;
 7 1;
 7 2;
 7 5;
 8 1;
 8 6;
 8 9;
 9 4;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 5;
 1 8;
];
M_.block_structure.dyn_tmp_nbr = 16;
M_.state_var = [4 3 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(15, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [29; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 4 6 9 2 3 4 5 6 7 8 7 2 4 9 1 2 3 7 3 4 5 8 5 6 8 1 1 9 ]);
M_.dynamic_g1_sparse_colval = int32([3 3 3 4 10 10 10 10 10 10 10 11 12 13 13 14 14 14 14 15 15 15 15 16 17 18 23 26 28 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 4 5 5 5 5 5 5 12 13 14 16 20 24 25 26 27 27 27 27 27 28 28 28 29 29 30 ]);
M_.lhs = {
'exp(c)^(-1)'; 
'exp(k)'; 
'exp(y)*(1-theta)/exp(h)'; 
'exp(y)'; 
'exp(w)'; 
'exp(r)'; 
'exp(I)'; 
'exp(prod)'; 
'z'; 
};
M_.static_tmp_nbr = [5; 2; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 9];
M_.block_structure_stat.block(1).variable = [ 4];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 5;
M_.block_structure_stat.block(2).mfs = 5;
M_.block_structure_stat.block(2).equation = [ 2 3 4 1 6];
M_.block_structure_stat.block(2).variable = [ 3 5 6 8 1];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 8];
M_.block_structure_stat.block(3).variable = [ 9];
M_.block_structure_stat.block(4).Simulation_Type = 3;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 7];
M_.block_structure_stat.block(4).variable = [ 2];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 5];
M_.block_structure_stat.block(5).variable = [ 7];
M_.block_structure_stat.variable_reordered = [ 4 3 5 6 8 1 9 2 7];
M_.block_structure_stat.equation_reordered = [ 9 2 3 4 1 6 8 7 5];
M_.block_structure_stat.incidence.sparse_IM = [
 1 5;
 1 8;
 2 1;
 2 3;
 2 5;
 3 1;
 3 5;
 3 6;
 4 1;
 4 3;
 4 4;
 4 6;
 5 1;
 5 6;
 5 7;
 6 1;
 6 3;
 6 8;
 7 1;
 7 2;
 7 5;
 8 1;
 8 6;
 8 9;
 9 4;
];
M_.block_structure_stat.tmp_nbr = 13;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 3 5 1 2 4 2 3 4 5 1 2 3 5 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 4 4 5 5 5 5 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 4 7 9 11 15 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([2 3 4 5 6 7 8 7 2 4 6 4 9 1 2 3 7 3 4 5 8 5 1 6 8 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 1 1 1 2 3 3 3 4 4 5 5 5 5 6 6 6 6 7 8 8 9 ]);
M_.static_g1_sparse_colptr = int32([1 8 9 12 14 18 22 23 25 26 ]);
M_.params(1) = 0.36;
theta = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(5) = 0.025;
delta = M_.params(5);
M_.params(3) = 0.95;
rho = M_.params(3);
M_.params(4) = 0.007;
sigmae = M_.params(4);
M_.params(6) = 2;
A = M_.params(6);
M_.params(7) = 1;
zss = M_.params(7);
M_.params(12) = (1+M_.params(6)/(1-M_.params(1))*(1-M_.params(1)*M_.params(2)*M_.params(5)/(1-M_.params(2)*(1-M_.params(5)))))^(-1);
hss = M_.params(12);
M_.params(11) = M_.params(12)*((1/M_.params(2)-(1-M_.params(5)))/(M_.params(1)*M_.params(7)))^(1/(M_.params(1)-1));
kss = M_.params(11);
M_.params(10) = M_.params(5)*M_.params(11);
Iss = M_.params(10);
M_.params(8) = M_.params(7)*M_.params(11)^M_.params(1)*M_.params(12)^(1-M_.params(1));
yss = M_.params(8);
M_.params(9) = M_.params(8)-M_.params(5)*M_.params(11);
css = M_.params(9);
M_.params(13) = 1/M_.params(2)-(1-M_.params(5));
rss = M_.params(13);
M_.params(14) = (1-M_.params(1))*M_.params(8)/M_.params(12);
wss = M_.params(14);
M_.params(15) = M_.params(8)/M_.params(12);
prodss = M_.params(15);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(3) = log(M_.params(11));
oo_.steady_state(1) = log(M_.params(8));
oo_.steady_state(5) = log(M_.params(9));
oo_.steady_state(2) = log(M_.params(10));
oo_.steady_state(6) = log(M_.params(12));
oo_.steady_state(8) = log(M_.params(13));
oo_.steady_state(7) = log(M_.params(14));
oo_.steady_state(4) = log(M_.params(7));
oo_.steady_state(9) = log(M_.params(15));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(4)^2;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
options_.hp_filter = 1600;
options_.irf = 20;
options_.order = 1;
options_.periods = 200;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'BaseModel_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
