// Function for Newton-Raphson method
function [root, iterations] = newton_raphson(x)
    f_x = x^3 - 2*x - 5;
    df_x = 3*x^2 - 2;
    tolerance = 1e-6;
    max_iterations = 100;

    iterations = 0;

    while iterations < max_iterations
        x1 = x - f_x / df_x;

        if abs(x1 - x) < tolerance
            root = x1;
            return
        end

        x = x1;
        iterations = iterations + 1;
    end

    root = x;
endfunction

// Example usage:
initial_guess = 2;

[root_newton, iterations_newton] = newton_raphson(initial_guess);
disp("Newton-Raphson Method:");
disp("Root: " + string(root_newton));
disp("Iterations: " + string(iterations_newton));
