function Az = BPM_DISP(A,b2,gamma,alpha,inv,Z,T)
%Az returns the propagation of the signal A(T) along the space axis Z,
%in a medium with group-velocity dispersion b2, nonlinearity gamma
%and linear attenuation alpha. 

Az=zeros(length(T),length(Z));

N=length(T);
ft=(-N/2:N/2-1)/(T(end)-T(1));

h=Z(2)-Z(1);
E=exp(1i*0.5*b2*(2*pi*ft).^2*h/2);
Az(:,1)=A;
prop=round(length(Z)*inv/Z(end));
b=-b2*9;
k=1;

for i=2:length(Z)
    if i==k*prop;
        %b2=-b2;
        b2=b;
        E=exp(1i*0.5*b2*(2*pi*ft).^2*h/2);
        k=k+1;
    end
        
    F1=fftshift(fft(A));
    Fdisp1=F1.*E;
    
    N=ifft(ifftshift(Fdisp1));
    Nl=N.*exp(1i*gamma*h*(abs(N)).^2);
    
    F2=fftshift(fft(Nl));
    Fdisp2=F2.*E;
    
    A=ifft(ifftshift(Fdisp2));
    Az(:,i)=A*exp(-alpha*Z(i)/2);
end

end