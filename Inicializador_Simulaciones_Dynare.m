%% Inicializador de Modelos en Dynare
% Autores: Matías Espinoza, Kevin Alvarez, Matías Vicuña
% Macroeconomía II - Magíster en Economía
% Universidad Alberto Hurtado

%% Primer Modelo: Hansen - Wright
% Usando el paper de Hansen y Wright (1992), replicamos el modelo.
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare BaseModel.mod;

%% Recolecto todos los resultados del Dynare usando
% get_simul_replications.m de Johannes Pfeifer
addpath('functions');

% Recopilamos los resultados
results = get_simul_replications(M_,options_);

%%
%filter series
simulated_series_filtered = NaN(size(results));
for ii=1:options_.simul_replic
    [trend, cycle]=sample_hp_filter(results(:,:,ii)',1600);
    simulated_series_filtered(:,:,ii)=cycle';
end

%%
%get variable positions
y_pos=strmatch('y',M_.endo_names,'exact');
c_pos=strmatch('c',M_.endo_names,'exact');
k_pos=strmatch('k',M_.endo_names,'exact');
h_pos=strmatch('h',M_.endo_names,'exact');
prod_pos=strmatch('prod',M_.endo_names,'exact');
I_pos = strmatch('I',M_.endo_names,'exact');
r_pos = strmatch('r',M_.endo_names,'exact');
w_pos = strmatch('w',M_.endo_names,'exact');
z_pos = strmatch('z',M_.endo_names,'exact');

%% Calculamos la Deviación de Cada una de las variables

var_positions=[y_pos; c_pos; k_pos; h_pos; prod_pos; I_pos; r_pos; w_pos; z_pos];
%get variable names
var_names=M_.endo_names_long(var_positions,:);

%Compute standard deviations
std_mat=std(simulated_series_filtered(var_positions,:,:),0,2)*100;

%% Generamos el Loop de las desviaciones relativas
std_c_y = zeros(options_.simul_replic,1);
std_I_y = zeros(options_.simul_replic,1);
std_h_y = zeros(options_.simul_replic,1);
std_w_y = zeros(options_.simul_replic,1);
std_h_w = zeros(options_.simul_replic,1);
corr_h_w = zeros(options_.simul_replic,1);

for jj = 1:options_.simul_replic
    std_c_y(jj,1) = std_mat(c_pos,:,jj)/std_mat(y_pos,:,jj);
    std_I_y(jj,1) = std_mat(I_pos,:,jj)/std_mat(y_pos,:,jj);
    std_h_y(jj,1) = std_mat(h_pos,:,jj)/std_mat(y_pos,:,jj);
    std_w_y(jj,1) = std_mat(w_pos,:,jj)/std_mat(y_pos,:,jj);
    std_h_w(jj,1) = std_mat(h_pos,:,jj)/std_mat(w_pos,:,jj);
    corr_h_w(jj,1) = corr(s(c_pos,:,jj),'std_mat(y_pos,:,jj)');
end




%% Segundo Modelo

dynare Hansen_1985.mod

%% Tercer Modelo


