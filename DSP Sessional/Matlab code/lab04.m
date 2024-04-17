clc;
clear all;
close all;

x = [-1 2 0 1]; % define the first sequence
h = [3 1 0 -1]; % define the second sequence
n1 = -1:1:2; % define the time interval for x
n2 = -2:1:1; % define the time interval for h
% Plotiing x(n)
subplot(2,2,1)
stem(n1,x)
xlim([min(n1)-1 max(n1)+1]);%xlim and ylim set the appropriate limits for the axes.
ylim([min(x)-1 max(x)+1]);
title('x(n)');
xlabel('Time')
ylabel('Amplitude')
% Plotiing h(n)
subplot(2,2,2)
stem(n2,h)
xlim([min(n2)-1 max(n2)+1]);
ylim([min(h)-1 max(h)+1]);
title('h(n)');
xlabel('Time')
ylabel('Amplitude')
% Creating Matrix
mat=[];
for i=1:length(x)
    ss=h.*x(i);
    mat=[mat;ss]; 
end

% Summation of the Values
[r c]=size(mat);
lim = r+c;
t=2;
y=[];
s=0;
while (t<=lim)
    for i=1:r
        for j=1:c
            if ((i+j)==t)
                s=s+mat(i,j);
            end
        end
    end
    t=t+1;
    y=[y s];
    s=0;
end

% Printing & Plotting
y;
n3=min(n1)+min(n2);
n4=max(n1)+max(n2);
n5=n3:n4;
subplot(2,2,3)
stem(n5,y)
xlim([n3-1 n4+1]);
ylim([min(y)-1 max(y)+1]);
title('convoultion');
xlabel('Time')
ylabel('Amplitude')