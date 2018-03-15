%Optical Communication Systems/Components
%Lab 7

clear all;
close all;
clc;

if 1==0
%Exercise 1

F=[3 4 5 6]; %dB
BER=[3.3546576944414E-11 2.29505265479945E-09 8.26302650900762E-08 1.66630153330906E-06];

figure;
plot(F,log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('F [dB]'); ylabel('log_{10}(BER)'); grid on;

%Exercise 2

loops=[50 45 40 35 30 25 20 15 10 5 1];
length=4*10^6./loops; %m
BER=[2.83979045171993E-11 6.84339381085985E-09 1.66630153330906E-06 0.000252714060803315 0.0126949823932421 0.137275503248836 0.374464019741708 0.43419933323306 0.434830543493453 0.434822840184714 0.434822840185103];
%BER=fliplr(BER);

figure;
plot(log10(length),log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('log_{10}(length [m])'); ylabel('log_{10}(BER)'); grid on;

%Exercise 3

loops=[50 45 40 35 30 25 20 15 10 5 1];
length=4*10^6./loops; %m
BER=[1.25468961167751E-14 1.24484321439784E-11 1.48643422824305E-08 1.20453309318471E-05 0.00274616499648326 0.0811723912982561 0.338600421719564 0.434127872997786 0.434832408394774 0.434822840184565 0.434822840185103];
%BER=fliplr(BER);

figure;
plot(log10(length),log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('log_{10}(length [m])'); ylabel('log_{10}(BER)'); grid on;

%Exercise 4

loops=[50 45 40 35 30 25 20 15 10];
length=loops; %m
BER=[1.25468961167751E-14 1.24484321439784E-11 1.48643422824305E-08 1.20453309318471E-05 0.00274616499648326 0.0811723912982561 0.338600421719564 0.434127872997786 0.434832408394774];
%BER=fliplr(BER);

figure;
plot(loops,log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('n° of amplifiers'); ylabel('log_{10}(BER)'); grid on;

%Exercise 5

fiberlength=3e+4; %m = 30 Km
loops=12;
steps=[1 2 3 4 5 6 7];
l=steps*fiberlength/loops;
BER=[0 0 5.856e-215 2.813e-25 0.026 0.231 0.3935];

figure;
plot(l,log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('length [m]'); ylabel('log_{10}(BER)'); grid on;

%Exercise 6

fiberlength=3e+4; %m = 30 Km
loops=12;
steps=[1 2 3 4 5 6 7];
l=steps*fiberlength/loops;
BER1=[0 0 5.856e-215 2.813e-25 0.026 0.231 0.3935]; %1mW=0dBm
BER2=[0 0 0 1e-41 0.0046 0.18876 0.382];    %2mW=3dBm
BER3=[0 0 0 5.494e-68 0.000266 0.139 0.366];    %4mW=6dBm
BER4=[0 0 0 8.916e-116 7.337e-7 0.093 0.350];    %8mW=9dBm
BER5=[0 0 0 9.767e-139 1.396e-10 0.0459 0.321];    %16mW=12dBm

figure;
plot(l,log10(BER1),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('length [m]'); ylabel('log_{10}(BER)'); grid on;
hold on;
plot(l,log10(BER2),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
xlabel('length [m]'); ylabel('log_{10}(BER)'); grid on;
hold on;
plot(l,log10(BER3),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('length [m]'); ylabel('log_{10}(BER)'); grid on;hold on;
hold on;
plot(l,log10(BER4),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',10);
xlabel('length [m]'); ylabel('log_{10}(BER)'); grid on;
hold on;
plot(l,log10(BER5),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
xlabel('length [m]'); ylabel('log_{10}(BER)'); grid on;

leg=legend('0 dBm','3 dBm','6 dBm','9 dBm','12 dBm');
set(leg,'Fontsize',12);
end
