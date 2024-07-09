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
M_.fname = 'HProduction';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'eps_m'};
M_.exo_names_tex(1) = {'eps\_m'};
M_.exo_names_long(1) = {'eps_m'};
M_.exo_names(2) = {'eps_h'};
M_.exo_names_tex(2) = {'eps\_h'};
M_.exo_names_long(2) = {'eps_h'};
M_.endo_names = cell(17,1);
M_.endo_names_tex = cell(17,1);
M_.endo_names_long = cell(17,1);
M_.endo_names(1) = {'k'};
M_.endo_names_tex(1) = {'k'};
M_.endo_names_long(1) = {'k'};
M_.endo_names(2) = {'i'};
M_.endo_names_tex(2) = {'i'};
M_.endo_names_long(2) = {'i'};
M_.endo_names(3) = {'l'};
M_.endo_names_tex(3) = {'l'};
M_.endo_names_long(3) = {'l'};
M_.endo_names(4) = {'ym'};
M_.endo_names_tex(4) = {'ym'};
M_.endo_names_long(4) = {'ym'};
M_.endo_names(5) = {'yh'};
M_.endo_names_tex(5) = {'yh'};
M_.endo_names_long(5) = {'yh'};
M_.endo_names(6) = {'cm'};
M_.endo_names_tex(6) = {'cm'};
M_.endo_names_long(6) = {'cm'};
M_.endo_names(7) = {'ch'};
M_.endo_names_tex(7) = {'ch'};
M_.endo_names_long(7) = {'ch'};
M_.endo_names(8) = {'km'};
M_.endo_names_tex(8) = {'km'};
M_.endo_names_long(8) = {'km'};
M_.endo_names(9) = {'kh'};
M_.endo_names_tex(9) = {'kh'};
M_.endo_names_long(9) = {'kh'};
M_.endo_names(10) = {'hm'};
M_.endo_names_tex(10) = {'hm'};
M_.endo_names_long(10) = {'hm'};
M_.endo_names(11) = {'hh'};
M_.endo_names_tex(11) = {'hh'};
M_.endo_names_long(11) = {'hh'};
M_.endo_names(12) = {'rm'};
M_.endo_names_tex(12) = {'rm'};
M_.endo_names_long(12) = {'rm'};
M_.endo_names(13) = {'rh'};
M_.endo_names_tex(13) = {'rh'};
M_.endo_names_long(13) = {'rh'};
M_.endo_names(14) = {'wm'};
M_.endo_names_tex(14) = {'wm'};
M_.endo_names_long(14) = {'wm'};
M_.endo_names(15) = {'wh'};
M_.endo_names_tex(15) = {'wh'};
M_.endo_names_long(15) = {'wh'};
M_.endo_names(16) = {'zm'};
M_.endo_names_tex(16) = {'zm'};
M_.endo_names_long(16) = {'zm'};
M_.endo_names(17) = {'zh'};
M_.endo_names_tex(17) = {'zh'};
M_.endo_names_long(17) = {'zh'};
M_.endo_partitions = struct();
M_.param_names = cell(9,1);
M_.param_names_tex = cell(9,1);
M_.param_names_long = cell(9,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'delta'};
M_.param_names_long(2) = {'delta'};
M_.param_names(3) = {'theta'};
M_.param_names_tex(3) = {'theta'};
M_.param_names_long(3) = {'theta'};
M_.param_names(4) = {'rho'};
M_.param_names_tex(4) = {'rho'};
M_.param_names_long(4) = {'rho'};
M_.param_names(5) = {'A'};
M_.param_names_tex(5) = {'A'};
M_.param_names_long(5) = {'A'};
M_.param_names(6) = {'a'};
M_.param_names_tex(6) = {'a'};
M_.param_names_long(6) = {'a'};
M_.param_names(7) = {'eta'};
M_.param_names_tex(7) = {'eta'};
M_.param_names_long(7) = {'eta'};
M_.param_names(8) = {'e'};
M_.param_names_tex(8) = {'e'};
M_.param_names_long(8) = {'e'};
M_.param_names(9) = {'gamma'};
M_.param_names_tex(9) = {'gamma'};
M_.param_names_long(9) = {'gamma'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 17;
M_.param_nbr = 9;
M_.orig_endo_nbr = 17;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
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
M_.eq_nbr = 17;
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
 1 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 23;
 0 12 24;
 2 13 0;
 3 14 0;
 0 15 0;
 0 16 0;
 0 17 25;
 0 18 0;
 0 19 0;
 0 20 0;
 4 21 0;
 5 22 0;]';
M_.nstatic = 9;
M_.nfwrd   = 3;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 5;
M_.ndynamic   = 8;
M_.dynamic_tmp_nbr = [15; 8; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'cm' ;
  6 , 'name' , 'ch' ;
  7 , 'name' , 'l' ;
  8 , 'name' , 'k' ;
  9 , 'name' , '9' ;
  10 , 'name' , 'ym' ;
  11 , 'name' , 'yh' ;
  12 , 'name' , 'rm' ;
  13 , 'name' , 'rh' ;
  14 , 'name' , 'wm' ;
  15 , 'name' , 'wh' ;
  16 , 'name' , '16' ;
  17 , 'name' , '17' ;
};
M_.mapping.k.eqidx = [8 9 ];
M_.mapping.i.eqidx = [8 ];
M_.mapping.l.eqidx = [3 4 7 ];
M_.mapping.ym.eqidx = [5 10 12 14 ];
M_.mapping.yh.eqidx = [6 11 13 15 ];
M_.mapping.cm.eqidx = [1 2 3 4 5 ];
M_.mapping.ch.eqidx = [1 2 3 4 6 ];
M_.mapping.km.eqidx = [5 9 10 12 ];
M_.mapping.kh.eqidx = [9 11 13 ];
M_.mapping.hm.eqidx = [7 10 14 ];
M_.mapping.hh.eqidx = [7 11 15 ];
M_.mapping.rm.eqidx = [1 3 12 ];
M_.mapping.rh.eqidx = [2 4 13 ];
M_.mapping.wm.eqidx = [14 ];
M_.mapping.wh.eqidx = [15 ];
M_.mapping.zm.eqidx = [10 16 ];
M_.mapping.zh.eqidx = [11 17 ];
M_.mapping.eps_m.eqidx = [16 ];
M_.mapping.eps_h.eqidx = [17 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 8 9 16 17 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(17, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(9, 1);
M_.endo_trends = struct('deflator', cell(17, 1), 'log_deflator', cell(17, 1), 'growth_factor', cell(17, 1), 'log_growth_factor', cell(17, 1));
M_.NNZDerivatives = [59; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([8 5 10 12 11 13 16 17 8 9 8 3 4 7 5 10 12 14 6 11 13 15 1 2 3 4 5 1 2 3 4 6 5 9 9 7 10 14 7 11 15 3 12 2 4 13 14 15 10 16 11 17 1 2 1 2 1 16 17 ]);
M_.dynamic_g1_sparse_colval = int32([1 8 8 8 9 9 16 17 18 18 19 20 20 20 21 21 21 21 22 22 22 22 23 23 23 23 23 24 24 24 24 24 25 25 26 27 27 27 28 28 28 29 29 30 30 30 31 32 33 33 34 34 40 40 41 41 46 52 53 ]);
M_.dynamic_g1_sparse_colptr = int32([1 2 2 2 2 2 2 2 5 7 7 7 7 7 7 7 8 9 11 12 15 19 23 28 33 35 36 39 42 44 47 48 49 51 53 53 53 53 53 53 55 57 57 57 57 57 58 58 58 58 58 58 59 60 ]);
M_.lhs = {
'a*cm^(e-1)/(a*cm^e+(1-a)*ch^e)'; 
'a*cm^(e-1)/(a*cm^e+(1-a)*ch^e)'; 
'A/l'; 
'A/l'; 
'cm'; 
'ch'; 
'l'; 
'k'; 
'k'; 
'ym'; 
'yh'; 
'rm'; 
'rh'; 
'wm'; 
'wh'; 
'log(zm)'; 
'log(zh)'; 
};
M_.static_tmp_nbr = [9; 4; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 16];
M_.block_structure_stat.block(1).variable = [ 16];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 17];
M_.block_structure_stat.block(2).variable = [ 17];
M_.block_structure_stat.block(3).Simulation_Type = 6;
M_.block_structure_stat.block(3).endo_nbr = 11;
M_.block_structure_stat.block(3).mfs = 11;
M_.block_structure_stat.block(3).equation = [ 3 4 5 6 7 2 1 10 11 12 13];
M_.block_structure_stat.block(3).variable = [ 12 3 6 5 10 13 7 4 11 8 9];
M_.block_structure_stat.block(4).Simulation_Type = 1;
M_.block_structure_stat.block(4).endo_nbr = 3;
M_.block_structure_stat.block(4).mfs = 3;
M_.block_structure_stat.block(4).equation = [ 15 14 9];
M_.block_structure_stat.block(4).variable = [ 15 14 1];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 8];
M_.block_structure_stat.block(5).variable = [ 2];
M_.block_structure_stat.variable_reordered = [ 16 17 12 3 6 5 10 13 7 4 11 8 9 15 14 1 2];
M_.block_structure_stat.equation_reordered = [ 16 17 3 4 5 6 7 2 1 10 11 12 13 15 14 9 8];
M_.block_structure_stat.incidence.sparse_IM = [
 1 6;
 1 7;
 1 12;
 2 6;
 2 7;
 2 13;
 3 3;
 3 6;
 3 7;
 3 12;
 4 3;
 4 6;
 4 7;
 4 13;
 5 4;
 5 6;
 5 8;
 6 5;
 6 7;
 7 3;
 7 10;
 7 11;
 8 1;
 8 2;
 9 1;
 9 8;
 9 9;
 10 4;
 10 8;
 10 10;
 10 16;
 11 5;
 11 9;
 11 11;
 11 17;
 12 4;
 12 8;
 12 12;
 13 5;
 13 9;
 13 13;
 14 4;
 14 10;
 14 14;
 15 5;
 15 11;
 15 15;
 16 16;
 17 17;
];
M_.block_structure_stat.tmp_nbr = 15;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 7 10 1 2 5 1 2 3 6 7 4 9 11 5 8 2 6 11 1 2 4 6 7 3 8 10 5 9 3 8 10 9 11 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 3 3 4 4 4 5 5 6 6 6 7 7 7 7 7 8 8 8 9 9 10 10 10 11 11 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 4 7 12 15 17 20 25 28 30 33 35 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([8 9 8 3 4 7 5 10 12 14 6 11 13 15 1 2 3 4 5 1 2 3 4 6 5 9 10 12 9 11 13 7 10 14 7 11 15 1 3 12 2 4 13 14 15 10 16 11 17 ]);
M_.static_g1_sparse_colval = int32([1 1 2 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6 6 7 7 7 7 7 8 8 8 8 9 9 9 10 10 10 11 11 11 12 12 12 13 13 13 14 15 16 16 17 17 ]);
M_.static_g1_sparse_colptr = int32([1 3 4 7 11 15 20 25 29 32 35 38 41 44 45 46 48 50 ]);
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.025;
delta = M_.params(2);
M_.params(3) = 0.36;
theta = M_.params(3);
M_.params(4) = 0.95;
rho = M_.params(4);
M_.params(5) = 1;
A = M_.params(5);
M_.params(6) = 0.5;
a = M_.params(6);
M_.params(7) = 0.08;
eta = M_.params(7);
M_.params(8) = 0.8;
e = M_.params(8);
M_.params(9) = 0.6666666666666666;
gamma = M_.params(9);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 4.900000000000001e-05;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
options_.hp_filter = 1600;
options_.irf = 20;
options_.loglinear = true;
options_.order = 1;
options_.periods = 179;
var_list_ = {'cm';'i';'km';'hh'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'HProduction_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
