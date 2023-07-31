// Function for Bisection method
function [root, iterations] = bisection(a, b)
    tolerance = 1e-6;
    max_iterations = 100;

    fa = a^3 - 2*a - 5;
    fb = b^3 - 2*b - 5;

    if sign(fa) * sign(fb) >= 0
        error("Function must have opposite signs at the interval endpoints.")
    end

    iterations = 0;

    while iterations < max_iterations
        c = (a + b) / 2;
        fc = c^3 - 2*c - 5;

        if abs(fc) < tolerance
            root = c;
            return
        end

        if sign(fc) * sign(fa) < 0
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end

        iterations = iterations + 1;
    end

    root = (a + b) / 2;
endfunction

// Example usage:
a = 1;
b = 3;

[root_bisection, iterations_bisection] = bisection(a, b);
disp("Bisection Method:");
disp("Root: " + string(root_bisection));
disp("Iterations: " + string(iterations_bisection));
