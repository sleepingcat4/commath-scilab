// Function to apply Simpson's Rule for numerical integration
function result = simpsons_rule(x)
    result = x^2;
endfunction

// Example usage with a function:
a = 0;
b = 2;
n = 100; // Number of subintervals

true_integral = 8/3; // True value of the integral
h = (b - a) / n;
x = a:h:b;
fx = simpsons_rule(x);
simpsons_approximation = (h/3) * (fx(1) + 4*sum(fx(2:2:n)) + 2*sum(fx(3:2:n-1)) + fx(n+1));

disp('Simpson''s Rule:');
disp("True Integral: " + string(true_integral));
disp("Approximation: " + string(simpsons_approximation));
disp("Absolute Error: " + string(abs(true_integral - simpsons_approximation)));
