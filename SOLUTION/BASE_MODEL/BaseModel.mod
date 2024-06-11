//////////////////////////////////////////////////////////////////////////
//Author : Kevin Alvarez
//Magíster en Economía : Econometría II - Modelo Base Hansen and 
//Wright (1992) - Replicación 1 - Final Project
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

check;
// Calcular ESTADO_ESTACIONARIO
steady;

// Calculo_Simulacion_Estocastica_(Opciones)
stoch_simul(hp_filter = 1600, order = 1,irf=20, periods = 200, simul_replic = 10000);
