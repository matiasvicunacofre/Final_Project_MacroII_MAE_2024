var k i l ym yh cm ch km kh hm hh rm rh wm wh zm zh; // el m denota que es de mercado, h de hogar

varexo eps_m eps_h; //ambos iguales a 0.007 cuando los introduzca como shock

parameters beta delta theta rho A a eta e gamma;

beta = 0.99;
delta = 0.025;
theta = 0.36;
rho = 0.95;
A = 1; //Hay que calibrar esto para cumplir condiciones que dice el paper
a = 0.5; //Hay que calibrar esto también para cumplir condiciones que dice el paper
eta = 0.08;
e = 0.8;
gamma = 2/3; // no es necesario, es el valor de la correlacion señalado en el paper

model;

//1 Euler de Consumo del bien de mercado
(a*cm^(e-1))/(a*cm^(e)+(1-a)*ch^(e)) = (beta*cm(+1)^(e-1)*(rm(+1) +(1-delta)))/(a*cm(+1)^(e)+(1-a)*ch(+1)^(e));


//2 Euler de Consumo del bien de hogar
(a*cm^(e-1))/(a*cm^(e)+(1-a)*ch^(e)) = (beta*cm(+1)^(e-1)*((1-delta)))/(a*cm(+1)^(e)+(1-a)*ch(+1)^(e))  + (beta*(1-a)*ch(+1)^(e-1)*rh)/(a*cm(+1)^(e)+(1-a)*ch(+1)^(e));


//3 Oferta de Trabajo mercado
A/l = (a*cm^(e-1))*rm/(a*cm^(e)+(1-a)*ch^(e));


//4 Oferta de Trabajo hogar
A/l = ((1-a)*ch^(e-1))*rh/(a*cm^(e)+(1-a)*ch^(e));


//5 Restricción de Recursos Mercado
cm = ym +(1-delta)*km(-1) - km;  


//6 Restricción de Recursos Hogar
ch = yh;

// Restriccion trabajo mercado y hogar
l = 1 - hh - hm;

//7 Ley de movimiento del capital
k = (1-delta)*k(-1) + i;


//8 Composición del capital
k = km + kh;


//9 Función de producción Mercado
ym = zm*km(-1)^(theta)*hm^(1-theta);


//10 Función de producción Hogar
yh = zh*kh(-1)^(eta)*hh^(1-eta);


//11 Pago al capital de Mercado
rm = theta*(ym/km(-1));


//12 Pago al capital de Hogar
rh = eta*(yh/kh(-1));


//13 Salario real de Mercado
wm = (1-theta)*(ym/hm);


//14 Salario real de Hogar
wh = (1-eta)*(yh/hh);


//15 Ley de movimiento del shock Mercado
log(zm)=rho*log(zm(-1))+eps_m;


//16 Ley de movimiento del shock Hogar
log(zh)=rho*log(zh(-1))+eps_h;


end;


steady;

shocks;
var eps_m = 0.007^2;
end;


check;
steady;
stoch_simul(order=1,irf=20,loglinear,hp_filter=1600, periods=179) cm i km hh;


