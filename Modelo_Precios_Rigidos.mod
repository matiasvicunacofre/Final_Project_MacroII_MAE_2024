
var c y n m r rp b a e  pib_1 pib_2 
w phi mc;
 //lambda z
varexo ua um u_d;

parameters beta alpha mn_bar R_bar b_bar  
tridente z_bar rho_a rho_mu theta c_bar m_bar 
n_bar m_pib x_bar theta_p lambda_p sigma gamma;

beta  = 0.99;
R_bar = 1/beta;
b_bar = 1/3;
m_pib = 0.4;
m_bar = (m_pib/(1 + m_pib));
alpha = 1/3;
c_bar = 1 - m_bar + (b_bar/R_bar) - b_bar;
x_bar = 1 - c_bar;
mn_bar = 1; 
rho_a = 0.9;
rho_mu = 0.9;
theta = 1*0.01;
n_bar = 1/3;
tridente = (1 - alpha)*(1/((1/n_bar)^2)); 
z_bar = c_bar-(tridente*(n_bar/2)^2);
theta_p = 3/4;
lambda_p = (1- theta_p)*(1-theta_p*beta)/theta_p;
sigma = 1;
gamma = 2;
model(linear);

//c = c(+1) - ((1*1+1*(1/2))/2)*(r-phi(+1))+ u_d;
c = c(+1) - (1/sigma)*(r-phi(+1))+ u_d;
//lambda = lambda(+1) + (r - phi(+1));

//z_bar*z = c_bar*c + u_d - (tridente*(n_bar/2)^2)*(2*n);

//z = -lambda;

c +  n  = w;

//n = w; 
//firma optimizando
//w = y - n;

//y  - m  = e;

//minimizacion de costos

m - n = w - e;

phi = beta*phi(+1) + lambda_p*mc;

mc = alpha*w + (1 - alpha)*e;

r = 2*r(-1) + 1*gamma*phi + um;

e  = e(+1) + rp - (r - phi(+1)) ;

rp = theta*b;

y  = a + alpha*n + (1 - alpha)*m;

pib_1 = y - m_bar*(e + m);

pib_2 = y - m_bar*m;

y     = c_bar*c + x_bar*e;

c_bar*c = y - m_bar*(e + m) + (b_bar/R_bar)*(b - (r - phi(+1))) - b_bar*b(-1);

//(1 - beta)*(c - mn) = beta*rn;

//rn = r + phi(+1);

//phi = mu + mn(-1) - mn;

//-(1/mn_bar)*mn = -(1/c_bar)*c + (beta/c_bar)*(rn + mu + c(+1)) ; 

 
//shocks
a = rho_a*a(-1) + ua;

//u_d  = rho_u_d*u_d(-1) + umu;

end;

check;

shocks;
var 	ua;      stderr 0*1; 
var 	um;      stderr 1*1; 
var     u_d;     stderr 0*0.01;
end;

stoch_simul(irf = 20, order = 1) c m w e n r pib_1 pib_2 phi; 
