
function rec_yield = recom_yield(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi)


kT = kT;
kS = kS;
spincons = spin_cst();
[Amtx,Cdiag] = Coperator(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi);
Cdct = ctranspose(Cdiag);
Aminv = inv(Amtx);
Amct = ctranspose(Amtx);
Amict = ctranspose(Aminv);

[P_Cir,P_SYield_R,P_T0Yield_R ,P_TPYield_R,P_TMYield_R] = cissProj(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi);
%P_T = kron([1 0 0 0;0 0.5 0.5 0;0 0.5 0.5 0;0 0 0 1],eye(6));
P_TPYield = kron([0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 1-sin(u)],eye(9));
P_TPYield_R1 = expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*...
      P_TPYield*expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));
P_T1=(P_Cir +P_TPYield_R1+P_TMYield_R);
P_T=(P_T0Yield_R +P_TPYield_R+P_TMYield_R);
P_Cir=P_T1/trace(P_T1);
%P_Cir=P_Ci;
Xmtx = Aminv*(P_Cir)*Amict;
Ymtx = Amct*P_T*Amtx;

rec_element = 0;
for k1 = 1:36
    for k2 = 1:36
        rec_element = rec_element + Xmtx(k1,k2)*Ymtx(k2,k1)/(Cdct(k2,k2) - Cdiag(k1,k1));
    end
end

rec_yield = (rec_element*1i*kT);    
      
end
