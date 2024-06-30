function [Mean] = Spherical_Mean(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi)

thetal = [0:(pi)/50:pi];
phil = [0:(2*pi)/50:2*pi];
%phil = [0];
[X,Y] = meshgrid(thetal,phil);
%Yield=[];
parfor k1 = 1:51
    phi = phil(k1);
    for k2 = 1:51
        theta = thetal(k2);
        R_test = abs(recom_yield(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi));   
        Yield(k1,k2) = (sin(theta)*(R_test));
        
    end
end
I    = trapz(thetal,Yield,2);
Mean1 = trapz(phil,I);
Mean = Mean1/(4*pi);