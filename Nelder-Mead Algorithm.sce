// Define the objective function
function f = objective_function(x)
    f = x^2 + 2*x + 1; // Example function: f(x) = x^2 + 2x + 1
endfunction

// Nelder-Mead Algorithm
options = optimset('MaxIter', 1000, 'TolFun', 1e-6); // Set options for the optimization
x0 = 5; // Starting point for the optimization
[x_min, f_min] = fminsearch(objective_function, x0, options);

// Display the results
disp("Nelder-Mead Algorithm");
disp(["Optimal x: " + string(x_min)]);
disp(["Minimum value: " + string(f_min)]);
