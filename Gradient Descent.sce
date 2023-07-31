// Define the objective function and its derivative (gradient)
function [f, g] = objective_and_gradient(x)
    f = x^2 + 2*x + 1; // Example function: f(x) = x^2 + 2x + 1
    g = 2*x + 2; // Gradient of the function: f'(x) = 2x + 2
endfunction

// Gradient Descent Method
function [x_min, f_min] = gradient_descent(x0, learning_rate, max_iter, tol)
    x = x0;
    f_min = %inf; // Initialize to a large value
    for iter = 1:max_iter
        [f, g] = objective_and_gradient(x);
        x = x - learning_rate * g;
        if abs(f - f_min) < tol
            break;
        end
        f_min = f; // Update f_min with the current value
    end
    x_min = x;
endfunction

// Example usage:
x0 = 5; // Starting point for optimization
learning_rate = 0.1; // Learning rate (step size)
max_iter = 1000; // Maximum number of iterations
tol = 1e-6; // Tolerance for stopping criterion

[x_min, f_min] = gradient_descent(x0, learning_rate, max_iter, tol);

// Display the results
disp("Gradient Descent Method");
disp(["Optimal x: " + string(x_min)]);
disp(["Minimum value: " + string(f_min)]);
