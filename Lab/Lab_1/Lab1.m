%Optical Communication Systems/Components
%Lab 1

clear all;
close all;
clc;

%BER VALUES
b=[8.2407745996413e-167 7.45280708982906e-100 2.69839988363331e-50 1.79919953197919e-24 7.40469207735089e-12 6.11850619761353e-6];
%DISTANCE VALUES (in meters)
d=[100000 110000 120000 130000 140000 150000];

figure;
plot(d,log10(b),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('Distance [m]'); ylabel('Log(BER)'); grid on;
%title('BER vs distance');
