function chem_r = chem_reaction(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi)

% chemical reaction rate constants 
kT = kT;
kS = kS;

[P_Cir,P_SYield_R,P_T0Yield_R ,P_TPYield_R,P_TMYield_R] = cissProj(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi);


chem_r = 0.5*(kS*(P_SYield_R) + kT*(P_T0Yield_R +P_TPYield_R+P_TMYield_R));

end

