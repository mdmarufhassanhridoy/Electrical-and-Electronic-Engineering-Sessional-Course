clc;
clear all;
close all;

f1 = 1;
f2 = 30;
a = 1;
sr = 400;     % Number of samples per second
d = 2;        % Duration of the sine wave in seconds

t = 0:1/sr:d;

y1 = a * sin(2 * pi * f1 * t);
y2 = a * sin(2 * pi * f2 * t);
y = y1 + y2;

randomSignal = rand(size(t)) - 0.5;  % Random values between -0.5 and 0.5

z = y + randomSignal;

order = 4;
cutoffFreq = 50;
normalizedCutoff = cutoffFreq / (sr / 2);

[b, a] = cheby1(order, 0.5 , normalizedCutoff, 'low');

denoisedSignal = filter(b, a, z);

figure;
subplot(3, 1, 1);
plot(t, y, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal (y)');

subplot(3, 1, 2);
plot(t, z, 'g');
xlabel('Time (s)');
ylabel('Amplitude');
title('Summative Signal with Random Noise (z)');

subplot(3, 1, 3);
plot(t, denoisedSignal, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('Denoised Signal (Chebyshev Filter)');