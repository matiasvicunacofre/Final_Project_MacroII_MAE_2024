// Titulo
title_string = 'Modelo de Hansen-Wright con Trabajo Divisible'

// Modelo Benchmark
var c k h y z r w i productividad;
varexo e_z;

parameters beta rho delta theta sigma_e A;

beta = 0.99;     // Factor de descuento
rho = 0.95;      // Persistencia del choque tecnológico
theta = 0.36;    // Participación del capital en la producción
delta = 0.025;   // Tasa de depreciación
sigma_e = 0.007; // Desviación estándar del choque tecnológico

// Calibración de A para que el nivel estacionario de horas trabajadas sea h = 1/3
A = 2;  // Valor inicial, se ajustará en el estado estacionario

model;
    // Euler de Consumo
    exp(c)^(-1) = beta * exp(c(+1))^(-1) * (r(+1) + (1 - delta));
    
    // Oferta de Trabajo (Trabajo Divisible)
    A * exp(c) = (1 - theta) * exp(y) / exp(h);

    // Producto marginal del capital
    r = theta * exp(y) / exp(k(-1));

    // Shock de producción
    z = rho * z(-1) + e_z;
    
    // Producción Cobb-Douglas
    exp(y) = exp(z) * exp(k(-1))^theta * exp(h)^(1 - theta);

    // Inversión
    exp(i) = exp(y) - exp(c);

    // Restricción de Recursos (LMK)
    exp(k) = (1 - delta) * exp(k(-1)) + exp(i);

    // Salario
    exp(w) = (1 - theta) * exp(y) / exp(h);

    // Productividad
    exp(productividad) = exp(y)/exp(h);
end;

shocks;
    var e_z; stderr sigma_e;
end;

initval;
    y = log(1);
    c = log(0.8);
    k = log(10);
    w = log(1);
    i = log(0.2);
    r = log(0.04);
    z = 0;
    h = log(1/3);
end;

steady;

check;

stoch_simul(order=1, periods=100000, irf=20, hp_filter = 1600) y c i k h productividad;
