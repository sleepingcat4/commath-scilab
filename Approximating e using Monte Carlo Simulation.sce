// Function to approximate e using Monte Carlo simulation
function approx_e = monte_carlo_e(trials)
    sum_e = 0;

    for i = 1:trials
        factorial_term = 1;
        for j = 1:i
            factorial_term = factorial_term * j;
        end
        sum_e = sum_e + 1 / factorial_term;
    end

    approx_e = sum_e;
endfunction

// Example usage:
trials_list = [100, 1000, 10000, 100000, 1000000];

for trials = trials_list
    approx_e = monte_carlo_e(trials);
    disp(["Trials: " + string(trials) + " | Approximation of e: " + string(approx_e)]);
end
