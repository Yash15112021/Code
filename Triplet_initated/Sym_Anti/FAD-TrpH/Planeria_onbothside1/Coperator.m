function [V_Cop,D_Cop] = Coperator(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi)

% the "C" operator 
Copm = hamiltonian(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi) - 1i*chem_reaction(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi);
%disp(Copm);
V_Cop=[];
D_Cop=[];
[V_Cop,D_Cop] = eig(Copm);

end