%% Inicializador de Modelos - Hansen - Wright (1992)
% Autores: Matías Espinoza, Kevin Alvarez, Matías Vicuña
% Macroeconomía II - Magíster en Economía
% Universidad Alberto Hurtado

%% Primera Extensión : Modelo Estándar
% Usando el paper de Hansen y Wright, replicamos la primera extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare BaseModel.mod;

%% Segunda Extensión - Modelo con Trabajo Indivisible
% Usando el paper de Hansen y Wright, replicamos la segunda extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare IndivisibleLabor.mod;

%% Tercera Extensión - Modelo con Gobierno
% Usando el paper de Hansen y Wright, replicamos la segunda extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare Goverment.mod;

%% Cuarta Extensión - Modelo con Ocio Divisible
% Usando el paper de Hansen y Wright, replicamos la segunda extensión.
% función "get_simul_replications.m" de Johannes Pfeifer
clearvars; close all; clc;

% Comenzamos definiendo el espacio de los modelo de dynare (.mod)
dynare NonseparableLeisure.mod;