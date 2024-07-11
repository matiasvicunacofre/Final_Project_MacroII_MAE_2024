///////////////////////////////////////////////////////////////////////////
/////////////////////////////Final project/////////////////////////////////
//Authors : Kevin Alvarez - Matias Espinoza - Matias Vicuña
//Magíster en Economía : Macroeconomía II - Modelo Neokeynesiano - Parte II
//Galí, J. (2015). Monetary policy, inflation, and the business cycle: an 
//introduction to the new Keynesian framework and its applications - Capítulo 4. pag 98.
//////////////////////////////////////////////////////////////////////////
/*
El presente código fuente replíca la solución del modelo Neokeynesiano básico,
presentando en Galí, J. (2015). Se considera la evaluación de 2 posibles reglas
de política monetaria y su efecto sobre el bienestar promedio ante shocks de
productividad y de preferencias.

Fuente: El presente trabajo tomó en consideración la réplica realizada por 
Johannes Pfeifer y Dmitry Matveev. Copyright (C) 2016-2022 Dmitry Matveev and Johannes Pfeifer
link: https://github.com/JohannesPfeifer/DSGE_mod/blob/master/Gali_2015/Gali_2015_chapter_4.mod
*/



// Variables endógenas
var y y_n y_tilda r r_n i pi z a n y_hat;

varexo e_z e_a;

// Parámetros
parameters rho_z rho_a beta eta theta epsilon sigma phi alpha phi_pi phi_y rho lambda THETA kappa psi_ya; 

// Valores
rho_z = 0.5;
rho_a = 0.9;
beta = 0.99;
eta = 4;
theta = 3/4;
epsilon = 9;
sigma = 1;
alpha = 1/4;
phi_pi = 1.5;
phi_y = 0.5/4;
phi = 5;

rho = (1/beta) - 1;
psi_ya = (phi + 1) / (sigma * (1 - alpha) + phi + alpha);
THETA = (1 - alpha) / (1 - alpha + alpha * epsilon);
lambda = ((1 - theta) * (1 - beta * theta) / theta) * THETA;
kappa = lambda * (sigma + (phi + alpha) / (1 - alpha));

// Modelo - Condiciones de primer orden log-linealizadas
model(linear);

// Ecuación de Euler
pi = beta * pi(+1) + kappa * y_tilda;

// Curva de Phillips
y_tilda = y_tilda(+1) - (1 / sigma) * (i - pi(+1) - r_n);

//Tasa de interés natural - de precios flexibles
r_n = rho + (1 - rho_z) * z - sigma * psi_ya * a * (1 - rho_a);

// Ecuación de Fisher
r = i - pi(+1);

// Producto natural
y_n = psi_ya * a;

// Brecha producto
y_tilda = y - y_n;

// Función de producción
y = a + (1 - alpha) * n;

//Brecha del producto con respecto a su estado estacionario
y_hat = y_n - steady_state(y); 
    

// Shocks lineales : de productividad y de preferencias
z = rho_z * z(-1) + e_z; //Shock de preferencias
a = rho_a * a(-1) + e_a; // Shock de productividad
    
// Taylor rule (sin expectativas) - regla 1
i = rho + phi_pi * pi + phi_y * y_tilda + phi_y * y_hat;
end;

///////////////////////////////////////////////////////////////////////////

// Condiciones de acuerdo con el shock
@#define nonsimul  = 1    
@#define simultech = 0   //Simulaciones con choque tecnológico
@#define simuldem = 0   //Simulaciones con choque de demanda
@#define simulboth = 0 //Simulaciones con ambos choques


@#if simultech ==1
// Shocks tecnológicos aislados

shocks(overwrite);
var e_a = 1;
var e_z=0;
end;
stoch_simul(order=1, simul_replic=10000, nograph, periods=200, noprint);

results_sim = get_simul_replications(M_, options_);

y_t = strmatch('y_tilda', M_.endo_names, 'exact');
pi_t = strmatch('pi', M_.endo_names, 'exact');

variance = zeros(2, options_.simul_replic);

for i = 1:options_.simul_replic
    variance(1, i) = var(results_sim(y_t, :, i));
    variance(2, i) = var(results_sim(pi_t, :, i));
end;
//Calcular y guardar los valores de L
L_valuest = zeros(1, options_.simul_replic);

for i = 1:options_.simul_replic
    L_valuest(1, i) = 0.5 * ((M_.params(7, 1) + (M_.params(8, 1) + M_.params(9, 1)) / (1 - M_.params(9, 1))) * variance(1, i) + M_.params(6, 1) / M_.params(13, 1) * variance(2, i)) / 100;
end;

// Histograma
fig_histo1= figure;
histogram(L_valuest);
title('L bajo shocks tecnológicos(Taylor rule sin expectativas)');
xlabel('L');
ylabel('Frequencia');
exportgraphics(fig_histo1, 'histograma1.png', 'Resolution', 300);
@# endif

@#if simuldem ==1
// Shocks de preferencias aislados

shocks(overwrite);
var e_a = 0;
var e_z=1;
end;
stoch_simul(order=1, simul_replic=10000, nograph, periods=200, noprint);

results_sim = get_simul_replications(M_, options_);

y_t = strmatch('y_tilda', M_.endo_names, 'exact');
pi_t = strmatch('pi', M_.endo_names, 'exact');

variance = zeros(2, options_.simul_replic);

for i = 1:options_.simul_replic
    variance(1, i) = var(results_sim(y_t, :, i));
    variance(2, i) = var(results_sim(pi_t, :, i));
end;

L_valuesd = zeros(1, options_.simul_replic);

for i = 1:options_.simul_replic
    L_valuesd(1, i) = 0.5 * ((M_.params(7,1) + (M_.params(8, 1) + M_.params(9, 1)) / (1 - M_.params(9, 1))) * variance(1, i) + M_.params(6, 1) / M_.params(13, 1) * variance(2, i)) / 100;
end;
fig_histo2= figure;
histogram(L_valuesd);
title('L bajo shocks de preferencias (Taylor rule sin expectativas)');
xlabel('L');
ylabel('Frequencia');
exportgraphics(fig_histo2, 'histograma2.png', 'Resolution', 300);
@# endif 

@#if simulboth ==1
// shocks en simultáneo

shocks(overwrite);
var e_a = 1;
var e_z=1;
end;
stoch_simul(order=1, simul_replic=10000, nograph, periods=200, noprint);

results_sim = get_simul_replications(M_, options_);

y_t = strmatch('y_tilda', M_.endo_names, 'exact');
pi_t = strmatch('pi', M_.endo_names, 'exact');

variance = zeros(2, options_.simul_replic);

for i = 1:options_.simul_replic
    variance(1, i) = var(results_sim(y_t, :, i));
    variance(2, i) = var(results_sim(pi_t, :, i));
end;

L_valuesb = zeros(1, options_.simul_replic);

for i = 1:options_.simul_replic
    L_valuesb(1,i) = 0.5 * ((M_.params(7,1) + (M_.params(8,1) + M_.params(9,1))/(1 - M_.params(9,1))) * variance(1,i) + M_.params(6,1)/M_.params(13,1) * variance(2,i))/100;
end;
//PLOT
fig_histo3= figure;
histogram(L_valuesb);
title('L bajo shocks simultáneos (Taylor rule sin expectativas)');
xlabel('L');
ylabel('Frequencia');
exportgraphics(fig_histo3, 'histograma3.png', 'Resolution', 300);
@# endif

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
//Código fuente para la réplica de la tabla 4.1
@#if nonsimul == 1

//Shock tecnológico
shocks;
    var e_a =1;
    var e_z = 0;
end;

stoch_simul(order=1, irf=0, noprint) y y_tilda pi;

// Valor de los parámetros
phis_pi = [1.5 1.5 5 1.5];
phis_y = [0.125 0 0 1];

//Almacenar resultados
results_tech = zeros(4, length(phis_pi));
results_demand = zeros(4, length(phis_pi));

// Loop con cada combinación de parámetros
for j = 1:length(phis_pi)
    set_param_value('phi_pi', phis_pi(j));
    set_param_value('phi_y', phis_y(j));
    stoch_simul(order=1, irf=0, noprint);
    results_tech(1, j) = oo_.var(1,1)^0.5; // Varianza de y
    results_tech(2, j) = oo_.var(3,3)^0.5; // Varianza de y_tilda
    results_tech(3, j) = oo_.var(7,7)^0.5; // Varianza de pi
    results_tech(4, j) = 0.5 * ((M_.params(7,1) + (M_.params(8,1) + M_.params(9,1))/(1 - M_.params(9,1))) * oo_.var(3,3) + M_.params(6,1)/M_.params(13,1) * oo_.var(7,7))/100; // Cálculo de L
end;
//Choque de preferencias
shocks;
    var e_a = 0;
    var e_z = 1;
end;

stoch_simul(order=1, irf=0, noprint) y y_tilda pi;

// Bucle para todos los parámetros
for j = 1:length(phis_pi)
    set_param_value('phi_pi', phis_pi(j));
    set_param_value('phi_y', phis_y(j));
    stoch_simul(order=1, irf=0, noprint);
    results_demand(1, j) = oo_.var(1,1)^0.5; // Varianza de y
    results_demand(2, j) = oo_.var(3,3)^0.5; // Varianza de y_tilda
    results_demand(3, j) = oo_.var(7,7)^0.5; // Varianza de pi
    results_demand(4, j) = 0.5 * ((M_.params(7,1) + (M_.params(8,1) + M_.params(9,1))/(1 - M_.params(9,1))) * oo_.var(3,3) + M_.params(6,1)/M_.params(13,1) * oo_.var(7,7))/100; // Cálculo de L
end;

// Resultados
fprintf('\n');
fprintf('----------------------------------------------------- \n');
fprintf('%-40s \n', "TABLA 4.1.1: Shock tecnológico*");
fprintf('----------------------------------------------------- \n');
fprintf('%-8s', 'phi_pi');
fprintf('%12.1f   ', phis_pi);
fprintf('\n%-8s', 'phi_y');
fprintf('%12.3f   ', phis_y);
fprintf('\n');

// Resultados de shock de tecnología
variable_names = {'y', 'y_tilda', 'pi', 'L'};
for i = 1:4
    fprintf('%-8s', variable_names{i});
    fprintf('%12.4f   ', results_tech(i, :));
    fprintf('\n');
end;

// Imprimir resultados
fprintf('\n');
fprintf('----------------------------------------------------- \n');
fprintf('%-40s \n', "TABLA 4.1.2: Shock de preferencias*");
fprintf('----------------------------------------------------- \n');
fprintf('%-8s', 'phi_pi');
fprintf('%12.1f   ', phis_pi);
fprintf('\n%-8s', 'phi_y');
fprintf('%12.3f   ', phis_y);
fprintf('\n');

//  Resultados shock de preferencias
for i = 1:4
    fprintf('%-8s', variable_names{i});
    fprintf('%12.4f   ', results_demand(i, :));
    fprintf('\n');
end;

@# endif