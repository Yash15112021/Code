function [P_Cir,P_SYield_R,P_T0Yield_R ,P_TPYield_R,P_TMYield_R] = cissProj(kT,kS,Jex,D,B0,u,diphi,dithe,az1,az4,theta, phi)




spincons = spin_cst();
% the initial state with CISS 
%P_Ci = kron([0 0 0 0;0 0.5*(1 - sin(u)) -0.5*cos(u) 0;0 -0.5*cos(u) 0.5*(1 + sin(u)) 0;0 0 0 0],eye(9));
P_Ci = kron([0 0 0 0;0 0.5*(1 + sin(u)) 0.5*cos(u) 0;0 0.5*cos(u) 0.5*(1 - sin(u)) 0;0 0 0 0],eye(9));
% rotation according to the the joint direction of the dipolar interaction
P_Cir = expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*...
     P_Ci*expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));

P_S = P_Cir;

% the recombination state with CISS
P_SYield = kron([0 0 0 0;0 0.5*(1 - sin(u)) -0.5*cos(u) 0;0 -0.5*cos(u) 0.5*(1 + sin(u)) 0;0 0 0 0],eye(9));
P_T0Yield = kron([0 0 0 0;0 0.5*(1 + sin(u)) 0.5*cos(u) 0;0 0.5*cos(u) 0.5*(1 - sin(u)) 0;0 0 0 0],eye(9));

P_TPYield = kron([0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 1-sin(u)],eye(9));
P_TMYield = kron([1 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0],eye(9));



%P_SYield = kron([0 0 0 0;0 0.5 -0.5 0;0 -0.5 0.5 0;0 0 0 0],eye(9));
%P_T0Yield = kron([0 0 0 0;0 0.5 0.5 0;0 0.5 0.5 0;0 0 0 0],eye(9));

%P_TPYield = kron([0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 1],eye(9));
%P_TMYield = kron([1 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0],eye(9));




% rotation according to the the joint direction of the dipolar interaction
P_SYield_R = expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*...
      P_SYield*expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));

% rotation according to the the joint direction of the dipolar interaction
P_T0Yield_R = expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*...
      P_T0Yield*expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));


% rotation according to the the joint direction of the dipolar interaction
P_TPYield_R = expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*...
      P_TPYield*expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));


% rotation according to the the joint direction of the dipolar interaction
P_TMYield_R = expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*...
      P_TMYield*expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));


% the recombination state with CISS
%P_S = kron([0 0 0 0;0 0.5 -0.5 0;0 -0.5 0.5 0;0 0 0 0],eye(6));
%P_T = kron([1 0 0 0;0 0.5 0.5 0;0 0.5 0.5 0;0 0 0 1],eye(6));







end




