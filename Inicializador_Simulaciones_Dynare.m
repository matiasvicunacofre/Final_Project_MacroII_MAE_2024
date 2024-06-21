%% Inicializador de Modelos
% Autores: Matías Espinoza, Kevin Alvarez, Matías Vicuña
% Macroeconomía II - Magíster en Economía
% Universidad Alberto Hurtado

%% Primera Extensión Modelo Hansen - Wright (1992): Modelo Estándar
% Usando el paper de Hansen y Wright, replicamos la primera extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare BaseModel.mod;

%% Segunda Extensión Modelo Hansen - Wright (1992): Modelo con Trabajo Indivisible
% Usando el paper de Hansen y Wright, replicamos la segunda extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare IndivisibleLabor.mod;