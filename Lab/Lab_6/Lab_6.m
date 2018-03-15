%Optical Communication Systems/Components
%Lab 6

clear all;
close all;
clc;

if 1==0
%Exercise 2

%2.1

f=[193202.5 193315.3125 193428.125 193540.9375 193653.75];
P=[-16.3394051617244 -4.83739092660904 10.2580561548299 -3.40225820340168 -18.786766781649];
q=f(1):0.1:f(end);
m=interp1(f,P,q,'linear');

p=max(m)-10;
figure;
plot(q,m); hold on;
plot(q,p); hold on;
plot(f,P,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('f [GHz]'); ylabel('Interpolated power [dBm]');

%2.1
longitudinal_mode_separation=f(2)-f(1);

c=3*10^8;
n=3.7;
L=c/(2*n*(f(2)-f(1))*10^9);

%Exercise 3

P=[0 0 8.94149816032683E-05 0.00110691608501354 0.413865236846011 1.50760927113104 2.53573569220332 3.53166664413798 4.54937601768552 5.54918250879905 6.56024236710314 7.56112558623472 8.5652116457853];
I=[0 5 10 15 20 25 30 35 40 45 50 55 60];

figure;
plot(I,P,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('Current [mA]'); ylabel('Power [mW]'); grid on;

m=(P(10)-P(5))/(I(10)-I(5));
q=P(5)-I(5);
y=m*(I-I(5))+P(5);

figure;
plot(I,P,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(I,y);
hold on;
xlabel('Current [mA]'); ylabel('Power [mW]'); grid on;

I=[0 5 10 15 20 25 30 35 40 45 50 55 60];
%P2 -> 0.2 interface reflection coefficient
P2=[0 0 9.82142277215447E-05 0.000954329402999409 0.00967589753204158 1.19701767315192 2.29669384808276 3.47555476164441 4.63618791790287 5.79966249822881 6.97240001214858 8.12870197045823 9.28816545029544];
%P5 -> 0.5 inteface reflection coefficient
P5=[0 0 7.36287785363064E-05 0.00197086157468048 0.752313191193235 1.54442494980217 2.31219780692985 3.07528855164769 3.84781020535079 4.61572870393941 5.38224529730901 6.15320091966202 6.92250726164503];

sl1=mean(P(6:end)./I(6:end));
sl2=mean(P2(6:end)./I(6:end));
sl5=mean(P5(6:end)./I(6:end));

figure;
plot(I,P2,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot(I,P5,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('Current [mA]'); ylabel('Power [mW]'); grid on;

leg=legend('interface reflection coefficient=0.2','interface reflection coefficient=0.5');
set(leg,'Fontsize',12);
%title('BER vs distance');

%Exercise 5

I=[0 0.005 0.01 0.015 0.02 0.025 0.03 0.035 0.04 0.045 0.05 0.055 0.06]*10^-3;
P=[0 0 1.18931719332379E-07 1.48712013287674E-06 0.000423057603910318 0.00151351645115101 0.00255299027950982 0.00356863504035452 0.00459186250194401 0.00559794706491128 0.00660898380822442 0.0076234626677868 0.00862792795404383];

figure;
plot(I,P,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(I,P);
xlabel('Current [mA]'); ylabel('Power [mW]'); grid on;

Dt=[0.809375 0.385546875 0.295703125 0.24609375 0.2140625]; %from 2 to 0.6 A!!! in nanoseconds
fr=1./Dt; %Gigahertz!!!
Ith=0.018;

figure;
plot([0.2 0.3 0.4 0.5 0.6]/(Ith-1),fr.^2,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(I,P);
xlabel('I/(I_{th}-1)'); ylabel('{f_r}^2'); grid on;

%Exercise 7

I=[0 20 40 60 80 100];   %mA
Pp=[3.492423449093 6.2397977411004 7.8497694842987 9.0348844409356 9.9779668449892 10.7900967724259];
Dc=[0 1.5878036679 4.1664826036 7.45598024649978 9.2939583261 10.7612244195]; %mW

Ppnew=[3.1183665287 9.9916698717 16.5486498663 23.3877602626 30.0311487334967 36.1179691326];   %mW
Dcnew=[55-25 73-14 80-1 87-1 100-(-18) 114-(-12)];

figure;
plot(1./Ppnew,Dcnew,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('1/P [1/mW]'); ylabel('\Delta C [GHz]'); grid on;


%Exercise 9

att=[20 18 16 14 12 10 8 6 4 2 0];
%x = received power [W]
%y = generated photocurrent [A]

%Avalanche multiplication = 1
x1=[9.99999999999992E-06 1.5848931924611E-05 2.51188643150958E-05 3.98107170553501E-05 6.30957344480191E-05 0.000100000000000001 0.000158489319246112 0.00025118864315096 0.000398107170553497 0.000630957344480193 0.001];
y1=[9.96306372086893E-06 1.58092607700768E-05 2.50752082238196E-05 3.97614004849286E-05 6.30385837213269E-05 9.993226422243E-05 0.000158407568078393 0.000251088624195466 0.000397983612916811 0.000630803697794524 0.000999808097410042];
x2=x1;
y2=[1.00253180389341E-05 1.58761245888071E-05 2.51487884613455E-05 3.98445211872057E-05 6.31349085163756E-05 0.00010004642961051 0.000158545355730996 0.000251257201323813 0.000398191863357695 0.00063106266187711 0.00100013153997529];

%Avalanche multiplication = 10
x3=[0.001 0.000630957344480193 0.000398107170553497 0.00025118864315096 0.000158489319246112 0.000100000000000001 6.30957344480191E-05 3.98107170553501E-05 2.51188643150958E-05 1.5848931924611E-05 9.99999999999992E-06];
y3=[0.000999808097410042 0.000630803697794524 0.000397983612916811 0.000251088624195466 0.000158407568078393 9.993226422243E-05 6.30385837213269E-05 3.97614004849286E-05 2.50752082238196E-05 1.58092607700768E-05 9.96306372086893E-06];
x4=x3;
y4=[0.0100041025035444 0.00631283220596633 0.00398366026523413 0.002513942639986 0.00158652655031274 0.00100129748948567 0.00063198806164066 0.000398926004824784 0.00025183920042136 0.000159006244017592 0.000100410820312014];

R1=y1/x1;
R2=y2/x2;
R3=y3/x3;
R4=y4/x4;

figure;
plot(x1,y1,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('Input optical power [W]'); ylabel('Averaged photocurrent [A]'); grid on;

figure;
plot(x2,y2,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
xlabel('Input optical power [W]'); ylabel('Averaged photocurrent [A]'); grid on;

figure;
plot(x3,y3,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
xlabel('Input optical power [W]'); ylabel('Averaged photocurrent [A]'); grid on;

figure;
plot(x4,y4,'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
xlabel('Input optical power [W]'); ylabel('Averaged photocurrent [A]'); grid on;
end































