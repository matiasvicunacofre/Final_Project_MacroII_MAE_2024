//////////////////////////////////////////////////////////////////////////
// Authors : Kevin Alvarez - Matias Espinoza - Matias Vicuña
// Magíster en Economía : Macroeconomía II - Modelo Base Hansen and 
// Wright (1992) - Replicación 1 - Final Project
//////////////////////////////////////////////////////////////////////////

// Modelo bajo Planificador central

// Variables endogenas
var y I k z c h w r prod;

// Variables exogenas
varexo e;

// Parametros
parameters theta beta rho sigmae delta A zss yss css Iss kss hss rss wss prodss;
// Valores parametros
theta = 0.36;
beta = 0.99;
delta = 0.025;
rho = 0.95;
sigmae = 0.007;
A=2;

// Valores de Estado estacionario
zss=1;
hss = (1+(A/(1-theta))*(1 - (beta*delta*theta)/(1-beta*(1-delta))))^(-1); 
kss = hss*((1/beta -(1-delta))/(theta*zss))^(1/(theta-1));
Iss = delta*kss;
yss = zss*kss^(theta)*hss^(1-theta);
css = yss-delta*kss;
rss =  1/beta - (1-delta);
wss = (1-theta)*(yss/hss);
prodss = yss/hss;


model;
// Ec de  Euler
exp(c)^(-1) = beta*(exp(c(+1))^(-1)*(exp(r(+1)) + 1-delta)); 
// Restricción de recursos
exp(k) = exp(y) + (1-delta)*exp(k(-1))- exp(c);
// oferta de trabajo
(1-theta)*exp(y)/exp(h)=A/(1-exp(h))*exp(c);
// Función de producción
exp(y)=exp(z)*exp(k(-1))^(theta)*exp(h)^(1-theta);
// Salarios reales
exp(w)=(1-theta)*(exp(y)/exp(h));
// Renta real
exp(r)=theta*(exp(y)/exp(k(-1)));
// Inversión
exp(I)=exp(y)-exp(c); 
// Productividad
exp(prod)= exp(y)/exp(h);
// Shock Lineal
 z = rho*z(-1) + e;
end;

// Dynare Soluciona
initval;
k = log(kss);
y = log(yss);
c = log(css);
I = log(Iss);
h =log(hss);
r= log(rss);
w= log(wss);
z = log(zss);
prod=log(prodss);
end;

shocks;
var e = sigmae^2;
end;

// Comprueba Condición de Blanchard-Khan
check;

// Calcular ESTADO_ESTACIONARIO
steady;

// Calculo_Simulacion_Estocastica_(Opciones)
stoch_simul(hp_filter = 1600, order = 1,irf=20, periods = 200, simul_replic = 10000);

% Recolecto todos los resultados del Dynare
% Recopilamos los resultados
results = get_simul_replications(M_,options_);

% Determinamos el N° de Simulaciones a descartar
N = 500;

% Aplicando el Filtro de Hodrick - Prescott
simulated_series_filtered = NaN(size(results));
for ii=1:options_.simul_replic
    [trend, cycle]=sample_hp_filter(results(:,:,ii)',1600);
    simulated_series_filtered(:,:,ii)=cycle';
end

% Sacamos la Posición de las Variables
y_pos=strmatch('y',M_.endo_names,'exact');
I_pos = strmatch('I',M_.endo_names,'exact');
k_pos=strmatch('k',M_.endo_names,'exact');
z_pos = strmatch('z',M_.endo_names,'exact');
c_pos=strmatch('c',M_.endo_names,'exact');
h_pos=strmatch('h',M_.endo_names,'exact');
w_pos = strmatch('w',M_.endo_names,'exact');
r_pos = strmatch('r',M_.endo_names,'exact');
prod_pos=strmatch('prod',M_.endo_names,'exact');

%% Estadísticas Descriptivas de las Variables
%  Desviación y Correlación Promedio - 10.000 Simulaciones

% Definimos las posiciones de las variables
var_positions = [y_pos; I_pos; k_pos; z_pos; c_pos; h_pos; w_pos; r_pos; prod_pos];

% Nombres de las Variables
var_names = M_.endo_names_long(var_positions,:);

% Calculamos la Desviación Estándar
std_mat = std(simulated_series_filtered(var_positions,:,N+1:end),0,2)*100;

% Almacenamos todos los resultados
corr_mat = zeros(9,options_.simul_replic - N);
stats_model = zeros(6,options_.simul_replic - N);

% Calculo Correlaciones
for ii=1:options_.simul_replic - N
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
for jj = 1:options_.simul_replic - N
    stats_model(1,jj) = std_mat(c_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(2,jj) = std_mat(I_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(3,jj) = std_mat(h_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(4,jj) = std_mat(w_pos,:,jj)/std_mat(y_pos,:,jj);
    stats_model(5,jj) = std_mat(h_pos,:,jj)/std_mat(w_pos,:,jj);
    stats_model(6,jj) = corr(results(c_pos,:,jj)',results(y_pos,:,jj)');
end

% Tabla 1: Estadísticas de las Variables
fprintf('\n');
fprintf('----------------------------------------------------- \n');
fprintf('%-40s \n',"ESTADÍSTICAS DE LAS VARIABLES*");
fprintf('----------------------------------------------------- \n');
fprintf('%-20s \t %11s \t %11s \n','','std(x)','corr(y,x)')
for ii=1:size(corr_mat,1)
    fprintf('%-20s \t %3.2f (%3.2f) \t %3.2f (%3.2f) \n',var_names{ii,:},mean(std_mat(ii,:,:),3),std(std_mat(ii,:,:),0,3),mean(corr_mat(ii,:),2),std(corr_mat(ii,:),0,2))
end
fprintf('----------------------------------------------------- \n');

% Tabla 2: Desviaciones Relativas Variables
fprintf('\n');
fprintf('------------------------- \n');
fprintf('%-40s \n','DESVIACIONES RELATIVAS*');
fprintf('------------------------- \n');
fprintf('std(c)/std(y) \t %3.2f \n', mean(stats_model(1,:),'all'));
fprintf('std(I)/std(y) \t %3.2f \n', mean(stats_model(2,:),'all'));
fprintf('std(h)/std(y) \t %3.2f \n', mean(stats_model(3,:),'all'));
fprintf('std(w)/std(y) \t %3.2f \n', mean(stats_model(4,:),'all'));
fprintf('std(h)/std(w) \t %3.2f \n', mean(stats_model(5,:),'all'));
fprintf('corr(h,w)     \t %3.2f \n', mean(stats_model(6,:),'all'));
fprintf('------------------------- \n');

fprintf('\n');
fprintf('%-40s \n','* Nota:');
fprintf('----------------------------------------------------- \n');
fprintf('- N° de Simulaciones consideradas: %d de %d \n',options_.simul_replic-N,options_.simul_replic);
fprintf('- N° de Periodos: %d\n', options_.periods);
fprintf('----------------------------------------------------- \n');

%%% IRF del Modelo
%% Según Paper Hansen and Wright (1992)
% Nota: Exportamos y Gráficamos de forma independiente de Dynare por Conveniencia

% Crear una figura
fig_IRF = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);

% Crear subplots para cada histograma
subplot(3, 3, 1);
plot(oo_.irfs.y_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('y con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 2);
plot(oo_.irfs.I_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('I con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 3);
plot(oo_.irfs.k_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('k con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 4);
plot(oo_.irfs.z_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('z con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 5);
plot(oo_.irfs.c_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('c con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 6);
plot(oo_.irfs.h_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('h con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 7);
plot(oo_.irfs.w_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('w con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 8);
plot(oo_.irfs.r_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('r con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

subplot(3, 3, 9);
plot(oo_.irfs.prod_e, 'LineWidth', 1.5, 'Color', 'b');
hold on;
yline(0, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '-');
title('Productividad con shock \epsilon_{t+1}');
xlabel('Periodos');
ylabel('%\Delta EE');

% Añadir un título general a la figura
sgtitle('IRF Modelo Estándar');

% Ajustar el tamaño de la figura y el papel
set(fig_IRF, 'PaperPositionMode', 'auto');
set(fig_IRF, 'PaperOrientation', 'landscape');
set(fig_IRF, 'PaperUnits', 'normalized');
set(fig_IRF, 'PaperPosition', [0 0 1 1]);

% Guardar la figura en formato PNG
exportgraphics(fig_IRF, 'IRF_standar_model.png', 'Resolution', 300);

%%% Histograma de las Estadísticas
%% Según Paper Hansen and Wright (1992)

% Crear una figura
fig_histogram = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);

% Crear subplots para cada histograma
subplot(2, 4, 1);
histogram(std_mat(1,:,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(std_mat(1,:,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Desviación del Producto');
xlabel('std(y)');
ylabel('Frecuencia');

subplot(2, 4, 2);
histogram(stats_model(1,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(stats_model(1,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Desviación Relativa Consumo/Producto');
xlabel('std(c)/std(y)');
ylabel('Frecuencia');

subplot(2, 4, 3);
histogram(stats_model(2,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(stats_model(2,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Desviación Relativa Inversión/Producto');
xlabel('std(I)/std(y)');
ylabel('Frecuencia');

subplot(2, 4, 4);
histogram(stats_model(3,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(stats_model(3,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Desviación Relativa Horas/Producto');
xlabel('std(h)/std(y)');
ylabel('Frecuencia');

subplot(2, 4, 5);
histogram(stats_model(4,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(stats_model(4,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Desviación Relativa Salario/Producto');
xlabel('std(w)/std(y)');
ylabel('Frecuencia');

subplot(2, 4, 6);
histogram(stats_model(5,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(stats_model(5,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Desviación Relativa Horas/Salario');
xlabel('std(h)/std(w)');
ylabel('Frecuencia');

subplot(2, 4, 7);
histogram(stats_model(6,:), 'FaceColor', 'b', 'FaceAlpha', 0.3);
hold on;
xline(mean(stats_model(6,:)), 'LineWidth', 2, 'Color', 'r', 'LineStyle', '-');
title('Correlación Horas/Salario');
xlabel('corr(h,w)');
ylabel('Frecuencia');

% Añadir un título general a la figura
sgtitle('Estadísticas: Modelo Estándar');

% Ajustar el tamaño de la figura y el papel
set(fig_histogram, 'PaperPositionMode', 'auto');
set(fig_histogram, 'PaperOrientation', 'landscape');
set(fig_histogram, 'PaperUnits', 'normalized');
set(fig_histogram, 'PaperPosition', [0 0 1 1]);

% Guardar la figura en formato PNG
exportgraphics(fig_histogram, 'stats_standar_model.png', 'Resolution', 300);