clc;
clear all;
close all;

f_angle = 1000;
d = 10;
t = 0:1/f_angle:1;
f1 =10;
s1 = d * sin(2*pi*f1*t);
subplot(5,2,1)
plot(t, s1)

y1 = fft(s1, 1024);
y2 = abs(y1);
subplot(5,2,2)
plot(y2)

f2 = 15;
s2 = d * sin(2*pi*f2*t);
subplot(5,2,3)
plot(t, s2)

y3 = fft(s2, 1024);
y4 = abs(y3);
subplot(5,2,4)
plot(y4)

s3 = s1 + s2;
subplot(5,2,5)
plot(t, s3)

y5 = fft(s3, 1024);
y6 = abs(y5);
subplot(5,2,6)
plot(y6)

noise = 0.25 * rand(size(t));
subplot(5,2,7)
plot(t, noise)

s4 = s3 + noise;
y7 = fft(s4, 1024);
y8 = abs(y7);
subplot(5,2,8)
plot(y8)

fo = 6; % filter order
fc = 50; % cut off freq.
w = 2 * fc / f_angle; % normalized filter

% Chebyshev filter
[c, d] = cheby1(fo, 0.5, w); % 0.5 is the ripple factor

f_s = filter(c, d, s4);
subplot(5,2,9)
plot(f_s)