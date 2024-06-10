// Modelo Benchamark
var c k h y z r w i productividad;
varexo e_z;

parameters beta rho delta theta sigma_e A;

// Calibracion
beta = 0.99;     // Factor de descuento
rho = 0.95;      // Persistencia del choque tecnológico
theta = 0.36;    // Participación del capital en la producción
delta = 0.025;   // Tasa de depreciación
sigma_e = 0.007; // Desviación estándar del choque tecnológico

// Calibracion de A para que el nivel estacionario de horas trabajadas sea h = 1/3
A = 2;  // Valor inicial, se ajustará en el estado estacionario

model;
    // Euler_de_Consumo
    exp(c)^(-1) = beta*exp(c(+1))^(-1)*(r(+1) + (1-delta));
    
    // Oferta_de_Trabajo
    (1-theta)*exp(y)/exp(h) = A/exp(1 - h)*exp(c);

    // Producto_marginal_capital
    r = theta*exp(y)/exp(k(-1));

    // Shock_de_produccion
    z = rho*z(-1) + e_z;
    
    // Produccion_Cobb_Douglas
    exp(y) = exp(z)*exp(k(-1))^(theta)*exp(h)^(1-theta);

    // Inversion
    exp(i) = exp(y)-exp(c);

    // Restriccion_Recursos_(LMK)
    exp(k) = (1 - delta) * exp(k(-1)) + exp(i);

    // Salario
    exp(w) = (1-theta)*exp(y)/exp(h);
    
    // Productividad
    productividad = exp(y)/exp(h);

end;

steady_state_model;
z = 1;
h = (1+(A/(1-theta))(1 - (beta*delta*theta)/(1-beta(1-delta))))^(-1); 
k = h*((1/beta -(1-delta))/(theta*z))^(1/(theta-1));
i = delta*k;
y = z*k^(theta)*h^(1-theta);
c = y-delta*k;
r =  1/beta - (1-delta);
w = (1-theta)*exp(y)/exp(h);
productividad = exp(y)/exp(h);
end;

shocks;
    var e_z; stderr sigma_e;
end;

check;
steady;

stoch_simul(order = 1, irf = 20, hp_filter = 1600, periods = 200)y c i k h productividad;
