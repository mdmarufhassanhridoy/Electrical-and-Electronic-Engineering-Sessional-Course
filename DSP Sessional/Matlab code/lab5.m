clc;
clear all;
Fs = 500; % Sampling frequency (in Hz)
T = 1;     
t = 0:1/Fs:1; % Time vector

% Generate the signals
s1 = sin(2*pi*1*t);   % Low frequency signal (1Hz)
subplot(4, 2, 1)
plot(t, s1);
title(" low freq signal 1 Hz Signal")
xlabel("time")
ylabel("amplitude")
s2 = sin(2*pi*100*t); % High frequency signal (100Hz)
subplot(4, 2, 2);
plot(t, s2);
title("high freq signal 100 Hz Signal")
xlabel("time")
ylabel("amplitude")
s3 = sin(2*pi*50*t);  % Mid-range frequency signal (50Hz)
subplot(4, 2, 3);
plot(t, s2);
title("mid range freq signal 50 Hz Signal")
xlabel("time")
ylabel("amplitude")
% Generate the composite signal s4
s4 = s1 + s2 + s3;
subplot(4, 2, 4);
plot(t, s2);
title("Generate the composite signal s4")
xlabel("time")
ylabel("amplitude")

f_low = 5;  % Lower cutoff frequency (in Hz)
f_high = 30; % Upper cutoff frequency (in Hz)
order = 100; % Filter order

% Design the FIR  filter using the fir1 function
b = fir1(order, f_low * 2 / Fs, 'low');
c= fir1(order, [f_low, f_high] * 2 / Fs, 'bandpass');
d= fir1(order, f_high * 2 / Fs, 'high');
e=fir1(order, [f_low, f_high] * 2 / Fs, 'stop');
filtered_s1 = filter(b, 1, s4);
filtered_s2 = filter(c, 1, s4);
filtered_s3 = filter(d, 1, s4);
filtered_s4 = filter(e, 1, s4);

subplot(4, 2, 5);
plot(t, filtered_s1);
title('Filtered  lowpass Signal ');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 2, 6);
plot(t, filtered_s2);
title('Filtered  highpass Signal ');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 2, 7);
plot(t, filtered_s3);
title('Filtered  bandpass Signal ');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 2, 8);
plot(t, filtered_s4);
title('Filtered  bandreject Signal ');
xlabel('Time (s)');
ylabel('Amplitude');
