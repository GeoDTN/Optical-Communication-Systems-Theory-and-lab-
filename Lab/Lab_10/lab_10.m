%Optical Communication Systems/Components
%Lab 8

clear all;
close all;
clc;

%T = last second throughput Gb/s
%Prx = average received power

%Prif=-0.95;
%Trif=9.97;

%0.2/0.3 quando cambia

T=[9.97 9.69 8.8 8.16 7.57 4.57 3.22 1.6 0.22 0];
Prx=[-0.95 -10.4 -10.6 -10.8 -11.1 -11.28 -11.4 -11.58 -11.86 -12.11];
alpha = -Prx-0.95;
figure;
plot(alpha,T,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('\alpha [dB]'); ylabel('Throughput [Gb/s]'); grid on;