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
M_.fname = 'Hansen_1985';
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
M_.exo_names(1) = {'eps_a'};
M_.exo_names_tex(1) = {'eps\_a'};
M_.exo_names_long(1) = {'eps_a'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'consumption'};
M_.endo_names(2) = {'w'};
M_.endo_names_tex(2) = {'w'};
M_.endo_names_long(2) = {'real wage'};
M_.endo_names(3) = {'r'};
M_.endo_names_tex(3) = {'r'};
M_.endo_names_long(3) = {'real interest rate'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'output'};
M_.endo_names(5) = {'h'};
M_.endo_names_tex(5) = {'h'};
M_.endo_names_long(5) = {'hours'};
M_.endo_names(6) = {'k'};
M_.endo_names_tex(6) = {'k'};
M_.endo_names_long(6) = {'capital stock'};
M_.endo_names(7) = {'invest'};
M_.endo_names_tex(7) = {'i'};
M_.endo_names_long(7) = {'investment'};
M_.endo_names(8) = {'lambda'};
M_.endo_names_tex(8) = {'\lambda'};
M_.endo_names_long(8) = {'TFP'};
M_.endo_names(9) = {'productivity'};
M_.endo_names_tex(9) = {'{\frac{y}{h}}'};
M_.endo_names_long(9) = {'Productivity'};
M_.endo_partitions = struct();
M_.param_names = cell(8,1);
M_.param_names_tex = cell(8,1);
M_.param_names_long = cell(8,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'\beta'};
M_.param_names_long(1) = {'discount factor'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'\delta'};
M_.param_names_long(2) = {'depreciation rate'};
M_.param_names(3) = {'theta'};
M_.param_names_tex(3) = {'\theta'};
M_.param_names_long(3) = {'capital share'};
M_.param_names(4) = {'gamma'};
M_.param_names_tex(4) = {'\gamma'};
M_.param_names_long(4) = {'AR coefficient TFP'};
M_.param_names(5) = {'A'};
M_.param_names_tex(5) = {'A'};
M_.param_names_long(5) = {'labor disutility parameter'};
M_.param_names(6) = {'h_0'};
M_.param_names_tex(6) = {'{h_0}'};
M_.param_names_long(6) = {'full time workers in steady state'};
M_.param_names(7) = {'sigma_eps'};
M_.param_names_tex(7) = {'\sigma_e'};
M_.param_names_long(7) = {'TFP shock volatility'};
M_.param_names(8) = {'B'};
M_.param_names_tex(8) = {'B'};
M_.param_names_long(8) = {'composite labor disutility parameter'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 8;
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
 0 4 0;
 0 5 13;
 0 6 0;
 0 7 0;
 1 8 0;
 0 9 0;
 2 10 0;
 0 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [3; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'c' ;
  4 , 'name' , 'k' ;
  5 , 'name' , 'y' ;
  6 , 'name' , 'r' ;
  7 , 'name' , 'w' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'productivity' ;
};
M_.mapping.c.eqidx = [1 2 3 ];
M_.mapping.w.eqidx = [7 ];
M_.mapping.r.eqidx = [1 6 ];
M_.mapping.y.eqidx = [2 3 5 6 7 9 ];
M_.mapping.h.eqidx = [2 5 7 9 ];
M_.mapping.k.eqidx = [3 4 5 6 ];
M_.mapping.invest.eqidx = [4 ];
M_.mapping.lambda.eqidx = [5 8 ];
M_.mapping.productivity.eqidx = [9 ];
M_.mapping.eps_a.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 3;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 8];
M_.block_structure.block(1).variable = [ 8];
M_.block_structure.block(1).is_linear = false;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [0 1 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 5;
M_.block_structure.block(2).mfs = 5;
M_.block_structure.block(2).equation = [ 2 5 3 1 6];
M_.block_structure.block(2).variable = [ 5 4 6 1 3];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 16;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [3 6 7 8 9 10 14 15 ];
M_.block_structure.block(3).Simulation_Type = 1;
M_.block_structure.block(3).endo_nbr = 2;
M_.block_structure.block(3).mfs = 2;
M_.block_structure.block(3).equation = [ 9 7];
M_.block_structure.block(3).variable = [ 9 2];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 2;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [3 4 ];
M_.block_structure.block(4).Simulation_Type = 3;
M_.block_structure.block(4).endo_nbr = 1;
M_.block_structure.block(4).mfs = 1;
M_.block_structure.block(4).equation = [ 4];
M_.block_structure.block(4).variable = [ 7];
M_.block_structure.block(4).is_linear = true;
M_.block_structure.block(4).NNZDerivatives = 1;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 3 5 1 2 1 2 3 5 3 1 3 4 5 4 4 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([3 3 3 6 6 7 7 7 7 8 9 9 9 10 14 15 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 4 4 4 6 10 11 14 15 15 15 15 16 17 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([]);
M_.block_structure.block(3).g1_sparse_colval = int32([]);
M_.block_structure.block(3).g1_sparse_colptr = int32([]);
M_.block_structure.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.variable_reordered = [ 8 5 4 6 1 3 9 2 7];
M_.block_structure.equation_reordered = [ 8 2 5 3 1 6 9 7 4];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 6;
 4 6;
 5 6;
 6 6;
 8 8;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 2 1;
 2 4;
 2 5;
 3 1;
 3 4;
 3 6;
 4 6;
 4 7;
 5 4;
 5 5;
 5 8;
 6 3;
 6 4;
 7 2;
 7 4;
 7 5;
 8 8;
 9 4;
 9 5;
 9 9;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 3;
];
M_.block_structure.dyn_tmp_nbr = 2;
M_.state_var = [8 6 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [29; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([3 4 5 6 8 1 2 3 7 6 2 3 5 6 7 9 2 5 7 9 3 4 4 5 8 9 1 1 8 ]);
M_.dynamic_g1_sparse_colval = int32([6 6 6 6 8 10 10 10 11 12 13 13 13 13 13 13 14 14 14 14 15 15 16 17 17 18 19 21 28 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 1 5 5 6 6 9 10 11 17 21 23 24 26 27 28 28 29 29 29 29 29 29 29 30 ]);
M_.lhs = {
'1/c'; 
'(1-theta)*y/h'; 
'c'; 
'k'; 
'y'; 
'r'; 
'w'; 
'log(lambda)'; 
'productivity'; 
};
M_.static_tmp_nbr = [3; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 8];
M_.block_structure_stat.block(1).variable = [ 8];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 5;
M_.block_structure_stat.block(2).mfs = 5;
M_.block_structure_stat.block(2).equation = [ 2 3 1 5 6];
M_.block_structure_stat.block(2).variable = [ 1 6 3 5 4];
M_.block_structure_stat.block(3).Simulation_Type = 1;
M_.block_structure_stat.block(3).endo_nbr = 2;
M_.block_structure_stat.block(3).mfs = 2;
M_.block_structure_stat.block(3).equation = [ 9 7];
M_.block_structure_stat.block(3).variable = [ 9 2];
M_.block_structure_stat.block(4).Simulation_Type = 3;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 4];
M_.block_structure_stat.block(4).variable = [ 7];
M_.block_structure_stat.variable_reordered = [ 8 1 6 3 5 4 9 2 7];
M_.block_structure_stat.equation_reordered = [ 8 2 3 1 5 6 9 7 4];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 3;
 2 1;
 2 4;
 2 5;
 3 1;
 3 4;
 3 6;
 4 6;
 4 7;
 5 4;
 5 5;
 5 6;
 5 8;
 6 3;
 6 4;
 6 6;
 7 2;
 7 4;
 7 5;
 8 8;
 9 4;
 9 5;
 9 9;
];
M_.block_structure_stat.tmp_nbr = 3;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 2 3 2 4 5 3 5 1 4 1 2 4 5 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 4 4 5 5 5 5 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 4 7 9 11 15 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([1 2 3 7 1 6 2 3 5 6 7 9 2 5 7 9 3 4 5 6 4 5 8 9 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 3 3 4 4 4 4 4 4 5 5 5 5 6 6 6 6 7 8 8 9 ]);
M_.static_g1_sparse_colptr = int32([1 4 5 7 13 17 21 22 24 25 ]);
title_string='Economy with indivisble labor' 
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.025;
delta = M_.params(2);
M_.params(3) = 0.36;
theta = M_.params(3);
M_.params(4) = 0.95;
gamma = M_.params(4);
M_.params(5) = 2;
A = M_.params(5);
M_.params(7) = 0.00712;
sigma_eps = M_.params(7);
M_.params(6) = 0.53;
h_0 = M_.params(6);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(7))^2;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
options_.hp_filter = 1600;
options_.irf = 20;
options_.loglinear = true;
options_.order = 1;
var_list_ = {'y';'c';'invest';'k';'h';'productivity'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
options_.hp_filter = 1600;
options_.irf = 20;
options_.loglinear = true;
options_.order = 1;
options_.periods = 115;
options_.simul_replic = 100;
var_list_ = {'y';'c';'invest';'k';'h';'productivity'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
simulated_series_raw=get_simul_replications(M_,options_);
simulated_series_filtered=NaN(size(simulated_series_raw));
for ii=1:options_.simul_replic
[trend, cycle]=sample_hp_filter(simulated_series_raw(:,:,ii)',1600);
simulated_series_filtered(:,:,ii)=cycle';
end
y_pos=strmatch('y',M_.endo_names,'exact');
c_pos=strmatch('c',M_.endo_names,'exact');
i_pos=strmatch('invest',M_.endo_names,'exact');
k_pos=strmatch('k',M_.endo_names,'exact');
h_pos=strmatch('h',M_.endo_names,'exact');
productivity_pos=strmatch('productivity',M_.endo_names,'exact');
var_positions=[y_pos; c_pos; i_pos; k_pos; h_pos; productivity_pos];
var_names=M_.endo_names_long(var_positions,:);
std_mat=std(simulated_series_filtered(var_positions,:,:),0,2)*100;
for ii=1:options_.simul_replic
corr_mat(1,ii)=corr(simulated_series_filtered(y_pos,:,ii)',simulated_series_filtered(y_pos,:,ii)');
corr_mat(2,ii)=corr(simulated_series_filtered(y_pos,:,ii)',simulated_series_filtered(c_pos,:,ii)');
corr_mat(3,ii)=corr(simulated_series_filtered(y_pos,:,ii)',simulated_series_filtered(i_pos,:,ii)');
corr_mat(4,ii)=corr(simulated_series_filtered(y_pos,:,ii)',simulated_series_filtered(k_pos,:,ii)');
corr_mat(5,ii)=corr(simulated_series_filtered(y_pos,:,ii)',simulated_series_filtered(h_pos,:,ii)');
corr_mat(6,ii)=corr(simulated_series_filtered(y_pos,:,ii)',simulated_series_filtered(productivity_pos,:,ii)');
end
fprintf('\n%-40s \n',title_string)
fprintf('%-20s \t %11s \t %11s \n','','std(x)','corr(y,x)')
for ii=1:size(corr_mat,1)
fprintf('%-20s \t %3.2f (%3.2f) \t %3.2f (%3.2f) \n',var_names{ii,:},mean(std_mat(ii,:,:),3),std(std_mat(ii,:,:),0,3),mean(corr_mat(ii,:),2),std(corr_mat(ii,:),0,2))
end


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Hansen_1985_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
