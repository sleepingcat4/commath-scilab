// Newton Interpolation
// Given x and y as the arrays of data points
function N = newton_interpolation(x, y, xi)
    n = length(x);
    F = zeros(n, n); // Initialize the F matrix with zeros
    F(:, 1) = y;     // Set the first column of F to y

    for i = 2:n
        for j = i:n
            F(j, i) = (F(j, i-1) - F(j-1, i-1)) / (x(j) - x(j-i+1));
        end
    end

    N = F(1, 1);
    term = 1;
    for i = 2:n
        term = term * (xi - x(i-1));
        N = N + F(i, i) * term;
    end
endfunction

// Example usage:
x = [1, 2, 4, 5]; // Data points x-coordinate
y = [2, 3, 1, 7]; // Data points y-coordinate
xi = linspace(1, 5, 100); // Points for interpolation
yi = newton_interpolation(x, y, xi);

// Visualization
clf;
plot(x, y, 'o', xi, yi);
xlabel('x');
ylabel('y');
title('Newton Interpolation');
