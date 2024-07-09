//////////////////////////////////////////////////////////////////////////
// Authors : Kevin Alvarez - Matias Espinoza - Matias Vicuña 
// Magíster en Economía : Econometría II - Home Production Model 
// Benhabib, Rogerson, and Wright (1991) - Replicación 1 - Final Project
//////////////////////////////////////////////////////////////////////////

// Modelo bajo Planificador central

// Variables endogenas
var y yh ym c ch cm I k kh km zh zm rh rm r hh hm h;

// Variables exogenas
varexo eh em;

// Parametros
parameters theta beta rho sigmaeh sigmaem n e delta a A zhss zmss yss css Iss kss hss rss  khss kmss chss cmss hhss hmss yhss ymss rhss rmss;

// Valores parametros
theta = 0.36;
beta  = 0.99;
delta = 0.025;
rho   = 0.95;
n     = 0.08;
e     = 0.8;
A     = 2;
a     = 0.6;

// Shocks
sigmaeh = 0.007;
sigmaem = 0.007;

// Valores de Estado estacionario
zmss = 1;
zhss = 1;
hmss = 0.33;
hhss = 0.28;
hss  = hmss+hhss;
khss = hhss*(n/(a/(beta*(1-a))*4^(e-1)))^(1/1-n);
kmss = hmss*(1/beta -(1-delta))/(theta*zmss)^(1/(theta-1));
kss  = khss+kmss;
ymss = zmss*kmss^(theta)*hmss^(1-theta);
yhss = zhss*khss^(n)*hhss^(1-n);
yss  = ymss+yhss;
cmss = ymss-delta*kss;
chss = yhss;
css  = (a*cmss^(e)+(1-a)*chss^(e))^(1/e);
rmss = 1/beta - (1-delta);
rhss = (a/(beta*(1-a)))*4^(e-1);
rss  = rmss+rhss;
Iss  = delta*kss;

// Modelo de Equilibrio
model;
//Euler
a*exp(cm)^(e-1)/exp(c)=beta*a*exp(cm(+1))^(e-1)/exp(c(+1))*(exp(rm(+1))+1-delta);
a*exp(ch)^(e-1)/exp(c)=beta*(1-a)*exp(ch(+1))^(e-1)/exp(c(+1))*exp(rh(+1));
exp(c)=(a*exp(cm)^(e)+(1-a)*exp(ch)^(e))^(1/e);
exp(km)=exp(ym)+(1-delta)*(exp(km(-1))+exp(kh(-1)))-exp(kh)-exp(cm);
exp(yh)=exp(ch);
exp(k)=exp(km)+exp(kh);
exp(ym)=exp(zm)*exp(km(-1))^(theta)*exp(hm)^(1-theta);
exp(yh)=exp(zh)*exp(kh(-1))^(n)*exp(hh)^(1-n);
exp(y)=exp(yh)+exp(ym);
exp(h)=exp(hm)+exp(hh);
A/1-exp(h)=a*exp(cm)^(e-1)/exp(c)*(1-theta)*exp(ym)/exp(hm);
A/1-exp(h)=(1-a)*exp(ch)^(e-1)/exp(c)*(1-n)*exp(yh)/exp(hh);
exp(I)=exp(ym)-exp(cm);
exp(rm)=theta*(exp(ym)/exp(km(-1)));
exp(rh)=n*(exp(yh)/exp(kh(-1)));
exp(r)=exp(rm)+exp(rh);
zm = rho*zm(-1) + em;
zh= rho*zh(-1) + eh;
end;


// Dynare Soluciona
initval;
k  = log(kss);
kh = log(khss);
km = log(kmss);
y  = log(yss);
ym = log(ymss);
yh = log(yhss);
c  = log(css);
cm = log(cmss);
ch = log(chss);
I  = log(Iss);
hm = log(hmss);
hh = log(hhss);
h  = log(hss);
rm = log(rmss);
rh = log(rhss);
r  = log(rss);
zm = log(zmss);
zh = log(zhss);
end;

shocks;
var em = sigmaem^2;
var eh= sigmaeh^2;
corr em, eh = 2/3;
end;

check;
// Calcular ESTADO_ESTACIONARIO
steady;

// Calculo_Simulacion_Estocastica_(Opciones)
stoch_simul(hp_filter = 1600, order = 1,irf=20, periods = 200, simul_replic = 10000);