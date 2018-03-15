%Optical Communication Systems/Components
%Lab 2

clear all;
close all;
clc;

%Exercise 2

%BER VALUES
b2=[6.6978724772408E-166 1.67912962913084E-68 8.82077525709863E-29 1.19654566781168E-12 4.60400846781768E-06 0.00250937983174439 0.0378458389445303];
b5=[2.99383217381434E-84 2.54416789059613E-35 2.42042214379816E-15 3.53058355370566E-07 0.000846538320716673 0.0234258226479763 0.103836681790396];
b10=[3.12092383671961E-43 1.2254896871094E-18 1.50659188941369E-08 0.000223733796523306 0.0130927599973346 0.0793614976302642 0.185298462974322];
%DISTANCE VALUES (in meters)
d=[80000 90000 100000 110000 120000 130000 140000];

figure;
plot(d,log10(b2),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(d,log10(b5),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot(d,log10(b10),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('Distance [m]'); ylabel('Log(BER)'); grid on;

leg=legend('2.5 Gb/s','5 Gb/s','10 Gb/s');
set(leg,'Fontsize',18);
%title('BER vs distance');


%Exercise 3
Pz=1.05*10^-5;
Po=10^-3;

%Attenuations in [dB/Km]
alin1=0.4;
alin2=0.6;
alin3=0.8;
alin4=1;

PzdB=10*log10(Pz/(10^-3));
PodB=10*log10(Po/(10^-3));

Dp=PodB-PzdB;

%Maximum lengths
L1=Dp/alin1;
L2=Dp/alin2;
L3=Dp/alin3;
L4=Dp/alin4;

%Exercise 4

%BER VALUES
b2=[0 3.61212644204659E-171 6.11952446732458E-69 7.75999284588707E-43 5.13270762621822E-31 2.56983973920967E-24 4.84162764624926E-21 9.74455944622044E-19 4.82995137646404E-17 2.21524875057646E-16 1.37114704900207E-15 9.31963104888285E-14 2.65219568856995E-11 4.71134798679836E-09];
b5=[1.98655448436106E-12 0.457312522397742 0.464039596593119 0.464031380192102 0.464031308327014 0.464031307676327 0.464031307669921 0.464031307669836 0.464031307669837 0.464031307669837 0.464031307669837 0.464031307669837 0.464031307669837 0.464031307669837];
b10=[4.48471458254501E-07 0.181143914495615 0.199127346507503 0.220568654750826 0.264819157463494 0.297808154493944 0.311896338045013 0.330710474253413 0.332732664687775 0.341666671739122 0.353606070571311 0.351343398604268 0.355540301153416 0.351642491266396];
%DISTANCE VALUES (in meters)
d=[100000 200000 300000 400000 500000 600000 700000 800000 900000 1000000 1100000 1200000 1300000 1400000];

figure;
plot(d,log10(b2),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(d,log10(b5),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot(d,log10(b10),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('Distance [m]'); ylabel('Log(BER)'); grid on;

leg=legend('2.5 Gb/s','5 Gb/s','10 Gb/s');
set(leg,'Fontsize',18);
%title('BER vs distance');


%Question 3

%n°of loops * length of the loop
L1=12.7*1e+5;
L5=2.698*1e+5;
L10=8.126*1e+4;


%Exercise 5
%1e+4 for dispersion 10e-6 s/m2
%1e+5 for dispersion 4e-6 s/m2
%1e+5 for dispersion 2e-6 s/m2
%5e+5 for dispersion 1.0e-6 s/m2

%Exercise 6

%BER VALUES
b2=[3.40079591136947E-145 1.02764207645374E-63 8.42226621825338E-28 1.71925515523932E-12 4.6499500669013E-06 0.0024279363906121];
b5=[3.50173602214766E-38 1.92727206736866E-22 1.98655448436106E-12 1.03992696413962E-06 0.000851624120595952 0.0210317561658849];
b10=[1.37103038785603E-11 1.1562863108181E-06 0.000515373625551588 0.0142929200833782 0.0805350502380374 0.197022129774759];
%DISTANCE VALUES (in meters)
d=[80000 90000 100000 110000 120000 130000];

figure;
plot(d,log10(b2),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(d,log10(b5),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot(d,log10(b10),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('Distance [m]'); ylabel('Log(BER)'); grid on;

leg=legend('2.5 Gb/s','5 Gb/s','10 Gb/s');
set(leg,'Fontsize',18);
%title('BER vs distance')

%Exercise 8
L1=4.4236*2e+4;
L2=4.4765*2e+4;
L3=4.4745*2e+4;
L4=4.4735*2e+4;

%Exercise 9

%BER VALUES
%b2=[0.464031307669835 0.464031307669835 0.464031307669835
%0.464031307669835 0.464031307669835]; with 1e+6 meters
b2=[8.45749460995012E-28 7.71273216405226E-133 0 0 0 0]; %1e+5 meters
b5=[2.16187925850669E-12 2.64584889356132E-30 7.48176304803321E-41 4.43077367204606E-38 9.9796011708123E-26 4.30574570566734E-15]; %1e+5 meters
b10=[0.000446178734183365 1.32768760361967E-06 2.51168207605908E-08 6.03222132157841E-11 2.99724476106425E-16 4.9157522817851E-06]; %1e+5 meters
%DISTANCE VALUES (in meters)
d=[0.001 0.0025 0.0063 0.0158 0.0398 0.100];
d=10*log10(d/(10^-3));

figure;
plot(d,log10(b2),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(d,log10(b5),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot(d,log10(b10),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('Power [dBm]'); ylabel('Log(BER)'); grid on;

leg=legend('2.5 Gb/s','5 Gb/s','10 Gb/s');
set(leg,'Fontsize',18);
%title('BER vs distance')





