// Function to apply Trapezoidal Rule for numerical integration
function result = trapezoidal_rule(x)
    result = x^2;
endfunction

// Example usage with a function:
a = 0;
b = 2;
n = 100; // Number of subintervals

true_integral = 8/3; // True value of the integral
h = (b - a) / n;
x = a:h:b;
fx = trapezoidal_rule(x);
trapezoidal_approximation = (h/2) * (fx(1) + 2*sum(fx(2:n)) + fx(n+1));

disp("Trapezoidal Rule:");
disp("True Integral: " + string(true_integral));
disp("Approximation: " + string(trapezoidal_approximation));
disp("Absolute Error: " + string(abs(true_integral - trapezoidal_approximation)));
