// Use funcprot(0) to disable redefining function warning
funcprot(0);

// Function to apply Runge-Kutta (RK4) method for solving ODEs
function [t, y] = runge_kutta_method(ode_func_name, tspan, y0, h)
    t0 = tspan(1);
    tf = tspan(2);
    t = t0:h:tf;
    y = zeros(1, length(t));
    y(1) = y0;
    
    for i = 1:length(t)-1
        k1 = h * feval(ode_func_name, t(i), y(i));
        k2 = h * feval(ode_func_name, t(i) + h/2, y(i) + k1/2);
        k3 = h * feval(ode_func_name, t(i) + h/2, y(i) + k2/2);
        k4 = h * feval(ode_func_name, t(i) + h, y(i) + k3);
        
        y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
endfunction

// Example usage with a first-order ODE: dy/dt = -0.1*y
function dydt = first_order_ode(t, y)
    dydt = -0.1 * y;
endfunction

// Visualization
tspan = [0, 20];
y0_values = [1, 2, 3]; // Different initial conditions
h = 0.1; // Step size

clf; // Clear the current figure
scf(0); // Create a new figure

for y0 = y0_values
    [t, y] = runge_kutta_method('first_order_ode', tspan, y0, h); // Pass the function name as a string
    plot(t, y, label="y0 = " + string(y0));
    hold on;
end
printf("Runge-Kutta Method (RK4): Solutions for different initial conditions\n");
xlabel("t");
ylabel("y");
legend();
