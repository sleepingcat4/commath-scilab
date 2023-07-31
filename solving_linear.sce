function [x, time] = solve_linear_system_gaussian_elimination(A, b)
    tic(); // Start the timer
    n = size(A, 1);
    Augmented = [A, b];

    for k = 1:n-1
        for i = k+1:n
            factor = Augmented(i, k) / Augmented(k, k);
            Augmented(i, k:n+1) = Augmented(i, k:n+1) - factor * Augmented(k, k:n+1);
        end
    end

    x = zeros(n, 1);
    x(n) = Augmented(n, n+1) / Augmented(n, n);
    
    for i = n-1:-1:1
        x(i) = (Augmented(i, n+1) - sum(Augmented(i, i+1:n) * x(i+1:n))) / Augmented(i, i);
    end

    time = toc(); // Stop the timer and get the elapsed time
endfunction

function [x, time] = solve_linear_system_lu_decomposition(A, b)
    tic(); // Start the timer
    [L, U, P] = lu(A);
    y = linsolve(L, P*b);
    x = linsolve(U, y);
    time = toc(); // Stop the timer and get the elapsed time
endfunction

// Example usage:
A = [3, -0.1, -0.2; 0.1, 7, -0.3; 0.3, -0.2, 10];
b = [7.85; -19.3; 71.4];

size_list = [10, 50, 100, 500, 1000]; // List of matrix sizes to test
time_gaussian_elimination = [];
time_lu_decomposition = [];

for n = size_list
    A = rand(n, n); // Generate a random n x n matrix
    b = rand(n, 1); // Generate a random n x 1 vector

    [x_gaussian_elimination, time_ge] = solve_linear_system_gaussian_elimination(A, b);
    [x_lu_decomposition, time_lu] = solve_linear_system_lu_decomposition(A, b);

    time_gaussian_elimination = [time_gaussian_elimination, time_ge];
    time_lu_decomposition = [time_lu_decomposition, time_lu];
end

disp("Matrix Size | Gaussian Elimination Time (s) | LU Decomposition Time (s)");
for i = 1:length(size_list)
    disp([string(size_list(i)), " | ", string(time_gaussian_elimination(i)), " | ", string(time_lu_decomposition(i))]);
end
