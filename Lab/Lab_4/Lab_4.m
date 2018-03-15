%Optical Communication Systems/Components
%Lab 4

clear all;
close all;
clc;

%Define spatial axis
z0=0;
z1=40000;
nz=1000;
Z=linspace(z0,z1,nz);

%Define temporal axis
T0=12.5*10^-12;
t0=-40*T0;
t1=40*T0;
%t0=-10^-9;
%t1=10^-9;
nt=1000;
T=linspace(t0,t1,nt);

if 1==1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1
b2=-5*10^-27;   %GVD [s/m]
gamma=0;
a=0;    %attenuation

T0=12.5*10^-12; %[s]
A0=1;
%t0=-10^-9;
%t1=10^-9;

A=A0*exp(-T.^2/(2*T0^2));   %gaussian pulse
Az=BPM(A,b2,gamma,a,Z,T);   %propagated pulse

figure;
surf(Z,T,abs(Az)); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A(Z,T)|');
end

if 1==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 2
T0=12.5*10^-12;
b2=-5*10^-27;
gamma=0;
a=0;

C=[0 2 -2];
L=T0^2/abs(b2);
len=[L/4 L/2 3/4*L L];
C1=zeros(size(len));
T1=zeros(size(len));

for k=1:length(C)
    for i=1:length(len)
        C1(k,i)=C(k)+(1+C(k)^2)*b2*len(i)/T0^2;
        T1(k,i)=T0*sqrt((1+C(k)*b2*len(i)/T0^2)^2+(b2*len(i)/T0^2)^2);
    end
end

figure;
plot(len,T1(1,:),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
hold on;
plot(len,T1(2,:),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
hold on;
plot(len,T1(3,:),'--s','Linewidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
xlabel('m'); ylabel('T_1');
leg=legend('C=0','C=2','C=-2');
set(leg,'Fontsize',12);

C=2;
A0=1;
A=A0*exp(-(1+1i*C)/2*(T/T0).^2);

S1=BPM(A,b2,gamma,a,linspace(z0,len(1),nz),T);
S1i=abs(S1(:,1)).^2;
S1i=S1i/max(S1i);
S1f=abs(S1(:,end)).^2;
S1f=S1f/max(S1f);

S2=BPM(A,b2,gamma,a,linspace(z0,len(2),nz),T);
S2i=abs(S2(:,1)).^2;
S2i=S2i/max(S1i);
S2f=abs(S2(:,end)).^2;
S2f=S2f/max(S2f);

S3=BPM(A,b2,gamma,a,linspace(z0,len(3),nz),T);
S3i=abs(S3(:,1)).^2;
S3i=S3i/max(S3i);
S3f=abs(S3(:,end)).^2;
S3f=S3f/max(S3f);

Z4=linspace(z0,len(4),nz);
S4=BPM(A,b2,gamma,a,Z4,T);
S4i=abs(S4(:,1)).^2;
S4i=S4i/max(S4i);
S4f=abs(S4(:,end)).^2;
S4f=S4f/max(S4f);

figure;
subplot(2,1,1);
plot(T,S1i); hold on; plot(T,S1f,'r'); xlabel('T'); ylabel('Normalized amplitude');
hold on; plot(T,ones(1,length(T))/exp(1),'g');
leg=legend('|A(0,T)|^2','|A(L/4,T)|^2','1/e');
set(leg,'Fontsize',12);

subplot(2,1,2);
plot(T,S2i); hold on; plot(T,S2f,'r'); xlabel('T'); ylabel('Normalized amplitude');
hold on; plot(T,ones(1,length(T))/exp(1),'g');
leg=legend('|A(0,T)|^2','|A(L/2,T)|^2','1/e');
set(leg,'Fontsize',12);

figure;
subplot(2,1,1);
plot(T,S3i); hold on; plot(T,S3f,'r'); xlabel('T'); ylabel('Normalized amplitude');
hold on; plot(T,ones(1,length(T))/exp(1),'g');
leg=legend('|A(0,T)|^2','|A(3/4L,T)|^2','1/e');
set(leg,'Fontsize',12);

subplot(2,1,2);
plot(T,S4i); hold on; plot(T,S4f,'r'); xlabel('T'); ylabel('Normalized amplitude');
hold on; plot(T,ones(1,length(T))/exp(1),'g');
leg=legend('|A(0,T)|^2','|A(L,T)|^2','1/e');
set(leg,'Fontsize',12);
end

if 1==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 3

b2=0;
gamma=0;
alpha=0.2*10^-3;    %conversion in [dB/m]
a=-log(10^(-alpha/10)); %conversion to linear units [1/m]
T0=12.5*10^-12;
A0=1;
A=A0*exp(-T.^2/(2*T0^2)); 
Az=BPM(A,b2,gamma,a,Z,T);

%Total attenuation computed is exp(-a*40000/2)=0.3981
m1=max(Az(:,1));
m2=max(Az(:,end));
att=m2/m1;

figure;
plot(T,abs(Az(:,1))); hold on; plot(T,abs(Az(:,end)),'r');  xlabel('T'); ylabel('|A(T)|');
end

if 1==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 4

z0=0;
z1=1e+5;
nz=1000;
Z=linspace(z0,z1,nz);


gamma=2*10^-3;  %[W/m]
a=0;
T0=12.5*10^-12;
P1=0.05;
P2=0.1;
P3=0.15;

M1=0.5+gamma*P1*Z(end)/pi;
M2=0.5+gamma*P2*Z(end)/pi;
M3=0.5+gamma*P3*Z(end)/pi;

b2=0;
A1=sqrt(P1)*exp(-T.^2/(2*T0^2));
Az1=BPM(A1,b2,gamma,a,Z,T);

A2=sqrt(P2)*exp(-T.^2/(2*T0^2));
Az2=BPM(A2,b2,gamma,a,Z,T);

A3=sqrt(P3)*exp(-T.^2/(2*T0^2));
Az3=BPM(A3,b2,gamma,a,Z,T);

b2=-5*10^-27;
gamma=0;
A4=sqrt(P1)*exp(-T.^2/(2*T0^2));
Az4=BPM(A4,b2,gamma,a,Z,T);

A5=sqrt(P2)*exp(-T.^2/(2*T0^2));
Az5=BPM(A5,b2,gamma,a,Z,T);

A6=sqrt(P3)*exp(-T.^2/(2*T0^2));
Az6=BPM(A6,b2,gamma,a,Z,T);

ph1=angle(Az1);
ph2=angle(Az2);
ph3=angle(Az3);
ph4=angle(Az4);
ph5=angle(Az5);
ph6=angle(Az6);

figure;
subplot(3,1,1); plot(T,ph1(:,end));  xlabel('s'); ylabel('\phi_{P1} (Z=L)');
subplot(3,1,2); plot(T,ph2(:,end));  xlabel('s'); ylabel('\phi_{P2} (Z=L)');
subplot(3,1,3); plot(T,ph3(:,end));  xlabel('s'); ylabel('\phi_{P3} (Z=L)');

figure;
subplot(3,1,1); plot(T,ph4(:,end));  xlabel('s'); ylabel('\phi_{P1} (Z=L)');
subplot(3,1,2); plot(T,ph5(:,end));  xlabel('s'); ylabel('\phi_{P2} (Z=L)');
subplot(3,1,3); plot(T,ph6(:,end));  xlabel('s'); ylabel('\phi_{P3} (Z=L)');
end

if 1==0
z0=0;
z1=1e+5;
nz=1000;
Z=linspace(z0,z1,nz);

T0=12.5*10^-12;
t0=-50*T0;
t1=50*T0;
nt=1000;
T=linspace(t0,t1,nt);

gamma=2*10^-3;
a=0;


b2=0;
P1=0.05;
P2=0.1;
P3=0.15;

A1=sqrt(P1)*exp(-T.^2/(2*T0^2));
Az1=BPM(A1,b2,gamma,a,Z,T);

A2=sqrt(P2)*exp(-T.^2/(2*T0^2));
Az2=BPM(A2,b2,gamma,a,Z,T);

A3=sqrt(P3)*exp(-T.^2/(2*T0^2));
Az3=BPM(A3,b2,gamma,a,Z,T);

M1=0.5+gamma*P1*Z(end)/pi;
M2=0.5+gamma*P2*Z(end)/pi;
M3=0.5+gamma*P3*Z(end)/pi;

fa1=fftshift(fft(Az1(:,end)));
fa2=fftshift(fft(Az2(:,end)));
fa3=fftshift(fft(Az3(:,end)));

figure;
subplot(3,1,1); plot(abs(fa1)); shading('interp');  xlabel('f bin'); ylabel('|A_{P1}(f)|');
subplot(3,1,2); plot(abs(fa2)); shading('interp');  xlabel('f bin'); ylabel('|A_{P2}(f)|');
subplot(3,1,3); plot(abs(fa3)); shading('interp');  xlabel('f bin'); ylabel('|A_{P3}(f)|');
end


if 1==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 5

T0=12.5*10^-12;
t0=-40*T0;
t1=40*T0;
nt=1000;
T=linspace(t0,t1,nt);

z0=0;
z1=10^5;
nz=1000;
Z=linspace(z0,z1,nz);

N=1;
b2=-15*10^-27;
gamma=2*10^-3;
T0=12.5*10^-12;
alpha=0;

A=N*sqrt(abs(b2)/(gamma*T0^2))*sech(T/T0);
Az=BPM(A,b2,gamma,alpha,Z,T);

Ag=N*exp(-T.^2/(2*T0^2));
Azg=BPM(Ag,b2,gamma,alpha,Z,T);

pp=abs(Az(500,:));
[pks locs]=findpeaks(pp);
dist=Z(locs);

% for i=1:length(dist)-1
%    d(i)=dist(i+1)-dist(i);
% end
% dm=mean(d);

figure;
surf(Z,T,abs(Azg)); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A(Z,T)|'); view([0 90]);

% %Full width at half-maximum
% figure;
% x=0.5;
% plot(T,abs(Az(:,1)/max(Az(:,1))).^2); hold on;
% plot(T,abs(Azg(:,1)/max(Azg(:,1))).^2,'r'); hold on;
% plot(T,x,'g');
% xlabel('s'); ylabel('|A(T)|');
% 
% figure;
% surf(Z(1:1:end),T,abs(Az(:,(1:1:end)))); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A(Z,T=0)|'); view([0 0]);
end

if 1==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 6

z0=0;
z1=2*10^6;
nz=1000;
Z=linspace(z0,z1,nz);

T0=12.5*10^-12;
t0=-40*T0;
t1=40*T0;
nt=1000;
T=linspace(t0,t1,nt);

N=1;
b2=-15*10^-27;
gamma=2*10^-3;
T0=12.5*10^-12;
alpha=0;
K=8;

A1=N*sqrt(abs(b2)/(gamma*T0^2))*sech(T/T0);
A2=-N*sqrt(abs(b2)/(gamma*T0^2))*sech((T-K*T0)/T0);
A=A1+A2;
Az=BPM(A,b2,gamma,alpha,Z,T);

pp=abs(Az(500,:));
[pks locs]=findpeaks(pp);
dist=Z(locs);

% for i=1:length(dist)-1
%    d(i)=dist(i+1)-dist(i);
% end
% dm=mean(d);

figure;
surf(Z,T,abs(Az)); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A_1(Z,T)|+|A_2(Z,T)|'); view([0 90]);
end

if 1==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 7

z0=0;
z1=10^5;
nz=1000;
Z=linspace(z0,z1,nz);

T0=12.5*10^-12;
t0=-40*T0;
t1=40*T0;
nt=1000;
T=linspace(t0,t1,nt);

dBm=6;
P=0.001*10^(dBm/10);

C=0;
b2=-20*10^-27;
gamma=2*10^-3;
alpha=0;
change=25000;
change2=90000;

A=sqrt(P)*exp(-(1+1i*C)/2*(T/T0).^2);
Az=BPM(A,b2,gamma,alpha,Z,T);
%Az2=BPM_DISP(A,b2,gamma,alpha,change,Z,T);
Az2=BPM_DISP(A,b2,gamma,alpha,change2,Z,T);

figure;
surf(Z,T,abs(Az2)); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A(Z,T)|');

figure;
subplot(2,1,1); surf(Z,T,abs(Az2)); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A(Z,T)|'); view([0 90]);
subplot(2,1,2); surf(Z,T,abs(Az2)); shading('interp'); xlabel('m'); ylabel('s'); zlabel('|A(Z,T)|'); view([0 0]);

figure;
subplot(2,1,1); plot(T,abs(Az2(:,1))); hold on; plot(T,abs(Az2(:,end)),'r'); xlabel('s'); ylabel('|A(T)|');
leg=legend('|A(T,0)|','|A(T,L)|');
set(leg,'Fontsize',12);
subplot(2,1,2); plot(abs(fftshift(fft(Az2(:,1))))); hold on; plot(abs(fftshift(fft(Az2(:,end)))),'r'); xlabel('f bins'); ylabel('|A(F)|');
leg=legend('fft|A(T,0)|','fft|A(T,L)|');
set(leg,'Fontsize',12);
end

if 1==0
% Exercise 8

z0=0;
z1=7*10^4;
nz=1000;
Z=linspace(z0,z1,nz);

T0=12.5*10^-12;
t0=-40*T0;
t1=40*T0;
nt=1000;
T=linspace(t0,t1,nt);

dBm=3;
P=0.001*10^(dBm/10);

C=0;
b2=-1*10^-27;
gamma=2*10^-3;
alpha=0;

A1=sqrt(P)*exp(-(1+1i*C)/2*(T/T0).^2);
A2=sqrt(P)*exp(-(1+1i*C)/2*(T/T0).^2).*exp(-1i*2*pi*100*10^9*T);
A3=sqrt(P)*exp(-(1+1i*C)/2*(T/T0).^2).*exp(1i*2*pi*100*10^9*T);
A=A1+A2+A3;

Az=BPM(A,b2,gamma,alpha,Z,T);
f1=fftshift(fft(Az(:,1)));
f2=fftshift(fft(Az(:,end)));

figure;
plot(abs(f1)); hold on; plot(abs(f2),'r'); xlabel('f bins'); ylabel('|A(F)|');
leg=legend('fft|A(T,0)|','fft|A(T,L)|');
set(leg,'Fontsize',12);
end







