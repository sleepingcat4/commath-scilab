// Function to apply Euler's method for solving ODEs
function [t, y] = euler_method(ode_func, tspan, y0, h)
    t0 = tspan(1);
    tf = tspan(2);
    t = t0:h:tf;
    y = zeros(1, length(t));
    y(1) = y0;
    
    for i = 1:length(t)-1
        y(i+1) = y(i) + h * feval(ode_func, t(i), y(i));
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
    [t, y] = euler_method(first_order_ode, tspan, y0, h);
    plot(t, y, label="y0 = " + string(y0));
    hold on;
end
printf("Eulers Method: Solutions for different initial conditions\n");
xlabel("t");
ylabel("y");
legend();
