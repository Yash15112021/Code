function Hamil = hamiltonian(kT,kS,Jex,D,B0,u,diphi,dithe,az1,az4,theta, phi)
Ge = 1.7609*1e11;
s_x = [0 0.5;0.5 0]; 
s_y = [0 -0.5i;0.5i 0]; 
s_z = [0.5 0;0 -0.5];


F_x = kron(s_x,eye(2)) + kron(eye(2),s_x);
F_y = kron(s_y,eye(2)) + kron(eye(2),s_y);
F_z = kron(s_z,eye(2)) + kron(eye(2),s_z);

% the dipolar interaction 
dip_diag = (2/3)*D*(-kron(s_x,s_x) - kron(s_y,s_y) + 2*kron(s_z,s_z));
dip_coup = kron(expm(-1i*F_z*diphi)*expm(-1i*F_y*dithe)*dip_diag*expm(1i*F_y*dithe)*expm(1i*F_z*diphi),eye(9));

% the exchange interaction 
spincons = spin_cst();
ex_coup = -Jex*(2*spincons(:,:,1)*spincons(:,:,4) + 2*spincons(:,:,2)*spincons(:,:,5) + 2*spincons(:,:,3)*spincons(:,:,6) + 0.5*eye(36));

%Hamil = Ge*B0*((spincons(:,:,1) + spincons(:,:,4))+(spincons(:,:,2) + spincons(:,:,5))+(spincons(:,:,3) + spincons(:,:,6)))+Ge*dip_coup + Ge*ex_coup + Ge*hyperfine(az1,az2);
%Hamil = Ge*B0*(spincons(:,:,3) + spincons(:,:,6))+Ge*dip_coup + Ge*ex_coup + Ge*hyperfine(az1,az4);
%Hamil = Ge*B0*((spincons(:,:,1) + spincons(:,:,4))+(spincons(:,:,2) + spincons(:,:,5)))+Ge*dip_coup + Ge*ex_coup + Ge*hyperfine(az);

Hamil = Ge*B0*((spincons(:,:,1) + spincons(:,:,4))*sin(theta)*cos(phi) +...
    (spincons(:,:,2) + spincons(:,:,5))*sin(theta)*sin(phi) +...
    (spincons(:,:,3) + spincons(:,:,6))*cos(theta)) +...
    Ge*dip_coup + Ge*ex_coup + Ge*hyperfine(az1,az4); 
   


end