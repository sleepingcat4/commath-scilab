// Function to approximate π using Monte Carlo simulation
function approx_pi = monte_carlo_pi(trials)
    count_inside_circle = 0;

    for i = 1:trials
        x = rand(1, 1);
        y = rand(1, 1);
        if (x^2 + y^2) <= 1
            count_inside_circle = count_inside_circle + 1;
        end
    end

    approx_pi = 4 * count_inside_circle / trials;
endfunction

// Example usage:
trials_list = [100, 1000, 10000, 100000, 1000000];

for trials = trials_list
    approx_pi = monte_carlo_pi(trials);
    disp(["Trials: " + string(trials) + " | Approximation of π: " + string(approx_pi)]);
end
