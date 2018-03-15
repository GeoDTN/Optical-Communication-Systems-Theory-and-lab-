%Optical Communication Systems/Components
%Lab 9

clear all;
close all;
clc;


%NF 5 dB

BER=[4.97572185451124e-11 5.37580848707492e-37 1.95775726157041e-48 6.10757063900905e-19 4.23375394725738e-8];
Po=[1.000000e-001 2.500000e-001 5.000000e-001 7.500000e-001 1];
OSNR=[22.315032248796 26.9792369822125 30.9955289166325 33.5980385970187 35.5363493709412];


plot(Po,log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(Po,OSNR,'-s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
xlabel('Output Power [W]'); ylabel('log_{10}(BER), OSNR'); grid on;
leg=legend('BER','OSNR');
set(leg,'Fontsize',12);

%OUTPUT POWER 1.000000e-001

BER=[4.97572185451124e-11 5.00745044415791e-11 5.04765814296157e-11 5.09869752121232e-11 5.16362504509823e-11 5.24644166222246e-11];
NF=[5 6 7 8 9 10];
OSNR=[22.315032248796 22.3106518572597 22.3051435446627 22.2982189073509 22.2895169725712 22.2785866154096];


figure;
plot(NF,log10(BER),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('Noise Figure [dB]'); ylabel('log_{10}(BER)'); grid on;

figure;
plot(NF,OSNR,'-s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
xlabel('Noise Figure [dB]'); ylabel('OSNR'); grid on;




%Question 3

T=10^12;
c=3*10^8;
f0=194.07*T;
%f1=-1.17*T+f0;
f1=-1.1702220867438*T+f0;
f2=-0.195*T+f0;
% f1=-1.1697720695495+f0;
% f2=-0.1950776460226+f0;
f3=-0.07*T+f0;
f4=0.83*T+f0;

% l1=c/f1
% l2=c/f2
% l3=c/f3
% l4=c/f4

% b2=-1.1697708672307*T+f0;
% b1=1.1702292379997*T+f0;
% lb2=c/b2;
% lb1=c/b1;








