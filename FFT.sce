// Function to implement the FFT algorithm
function [X] = my_fft(x)
    N = length(x);
    if N == 1
        X = x;
    else
        even = my_fft(x(1:2:N));
        odd = my_fft(x(2:2:N));
        W = exp(-%i * 2 * %pi / N * (0:N/2-1));
        X = [even + W .* odd, even - W .* odd];
    end
endfunction


// Example usage:
t = 0:0.001:1; // Time vector
f1 = 5; // Frequency of the first component
f2 = 15; // Frequency of the second component
signal = sin(2*%pi*f1*t) + 0.5*sin(2*%pi*f2*t); // Create a signal with two frequency components

clf;
scf(0);
subplot(2, 1, 1);
plot(t, signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time Domain Signal');

subplot(2, 1, 2);
X = my_fft(signal); // Compute FFT of the signal
frequencies = (0:length(X)-1) * (1 / (t(2) - t(1))) / length(X); // Compute corresponding frequencies
plot(frequencies, abs(X));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Domain Signal');
