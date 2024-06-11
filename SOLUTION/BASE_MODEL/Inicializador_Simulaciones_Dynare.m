%% Inicializador de Modelo Base
% Autores: Matías Espinoza, Kevin Alvarez, Matías Vicuña
% Macroeconomía II - Magíster en Economía
% Universidad Alberto Hurtado

%% Primer Modelo: Hansen - Wright
% Usando el paper de Hansen y Wright (1992), replicamos la primera extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
addpath('functions');
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare BaseModel.mod;

%Recolecto todos los resultados del Dynare usando
% Recopilamos los resultados
results = get_simul_replications(M_,options_);

% Aplicando el Filtro de Hodrick - Prescott
simulated_series_filtered = NaN(size(results));
for ii=1:options_.simul_replic
    [trend, cycle]=sample_hp_filter(results(:,:,ii)',1600);
    simulated_series_filtered(:,:,ii)=cycle';
end

% Sacamos la Posición de las Variables
y_pos=strmatch('y',M_.endo_names,'exact');
c_pos=strmatch('c',M_.endo_names,'exact');
k_pos=strmatch('k',M_.endo_names,'exact');
h_pos=strmatch('h',M_.endo_names,'exact');
prod_pos=strmatch('prod',M_.endo_names,'exact');
I_pos = strmatch('I',M_.endo_names,'exact');
r_pos = strmatch('r',M_.endo_names,'exact');
w_pos = strmatch('w',M_.endo_names,'exact');
z_pos = strmatch('z',M_.endo_names,'exact');

%% Estadísticas Descriptivas de las Variables
%  Desviación y Correlación Promedio - 10.000 Simulaciones

% Definimos las posiciones de las variables
var_positions = [y_pos; c_pos; k_pos; h_pos; prod_pos; I_pos; r_pos; w_pos; z_pos];

% Nombres de las Variables
var_names = M_.endo_names_long(var_positions,:);

% Calculamos la Desviación Estándar
std_mat = std(simulated_series_filtered(var_positions,:,:),0,2)*100;

% Almacenamos todos los resultados
corr_mat = zeros(9,options_.simul_replic);
stats_model = zeros(6,options_.simul_replic);

% Calculo Correlaciones
for ii=1:options_.simul_replic
   corr_mat(1,ii)=corr(results(y_pos,:,ii)',results(y_pos,:,ii)');
   corr_mat(2,ii)=corr(results(y_pos,:,ii)',results(c_pos,:,ii)');
   corr_mat(3,ii)=corr(results(y_pos,:,ii)',results(I_pos,:,ii)');
   corr_mat(4,ii)=corr(results(y_pos,:,ii)',results(k_pos,:,ii)');
   corr_mat(5,ii)=corr(results(y_pos,:,ii)',results(h_pos,:,ii)');
   corr_mat(6,ii)=corr(results(y_pos,:,ii)',results(prod_pos,:,ii)');
   corr_mat(7,ii)=corr(results(y_pos,:,ii)',results(r_pos,:,ii)');
   corr_mat(8,ii)=corr(results(y_pos,:,ii)',results(w_pos,:,ii)');
   corr_mat(9,ii)=corr(results(y_pos,:,ii)',results(z_pos,:,ii)');
end

% Calculo Desviaciones Relativas
for jj = 1:options_.simul_replic
    stats_model(1,jj) = std_mat(c_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(2,jj) = std_mat(I_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(3,jj) = std_mat(h_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(4,jj) = std_mat(w_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(5,jj) = std_mat(h_pos,:,jj)/std_mat(w_pos,:,jj);
    stats_model(6,jj) = corr(results(c_pos,:,jj)',results(y_pos,:,jj)');
end

% Tabla 1: Estadísticas de las Variables
fprintf('\n%-40s \n',"Estadísticas de las Variables");
fprintf('%-20s \t %11s \t %11s \n','','std(x)','corr(y,x)')
for ii=1:size(corr_mat,1)
    fprintf('%-20s \t %3.2f (%3.2f) \t %3.2f (%3.2f) \n',var_names{ii,:},mean(std_mat(ii,:,:),3),std(std_mat(ii,:,:),0,3),mean(corr_mat(ii,:),2),std(corr_mat(ii,:),0,2))
end

% Tabla 2: Desviaciones Relativas Variables
fprintf('\n%-40s \n','Desviaciones Relativas');
fprintf('------------------------- \n');
fprintf('std(c)/std(y) \t %3.2f \n', mean(stats_model(1,:),"all"));
fprintf('std(I)/std(y) \t %3.2f \n', mean(stats_model(2,:),'all'));
fprintf('std(h)/std(y) \t %3.2f \n', mean(stats_model(3,:),'all'));
fprintf('std(w)/std(y) \t %3.2f \n', mean(stats_model(4,:),'all'));
fprintf('std(h)/std(w) \t %3.2f \n', mean(stats_model(5,:),'all'));
fprintf('corr(h,w)     \t %3.2f \n', mean(stats_model(6,:),'all'));
fprintf('------------------------- \n');
