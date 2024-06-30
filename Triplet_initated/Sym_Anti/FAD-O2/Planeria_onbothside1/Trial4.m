theta = 0;
phi = 0;
dithe=pi/4;
diphi=0;
%u=pi/2;
kT =(1e5);
kS =(1e7);
Jex = (0)*1e-3;
D = (-0)*1e-3;
B0=100*1e-6;
%u_l=[0,pi/6,pi/4,pi/3,pi/2];

u=0;



thetal = [0:(pi)/20:pi];
phil = [0:(2*pi)/20:2*pi];
%phil = [0];
[X,Y] = meshgrid(thetal,phil);
%Yield=[];
for k1 = 1:21
    phi = phil(k1);
    for k2 = 1:21
        theta = thetal(k2);
        R_test = abs(recom_yield(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi));   
        Yield(k1,k2) = (sin(theta)*(R_test));
        
    end
end
I    = trapz(thetal,Yield,2);
Mean1 = trapz(phil,I);
Mean = Mean1/(4*pi);