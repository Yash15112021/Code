kT =(1e6);
kS =(1e8);
Jex = (0)*1e-3;
D = (-0.0)*1e-3;
B0 = (5)*1e-5;
B_l=[0:1000/50:1000];
az1=1;
az2=1;
u=pi/2;

P_C = ([0 0 0 0;0 0.5 -0.5 0;0 -0.5 0.5 0;0 0 0 0]);%singlet yield wiyh u=0
%P_C = ([0 0 0 0;0 1 0 0;0 0 0 0;0 0 0 0]);%updown wiyh u=pi/2
%P_C = ([0 0 0 0;0 0 0 0;0 0 1 0;0 0 0 0]);%downup with u=pi/2 



t1 = [0:(10)/1000:10]*1e-3;
Copm = hamiltonian(kT,kS,Jex,D,B0,u,diphi,dithe,az1,az2) - 1i*chem_reaction(kT,kS,Jex,D,B0,u,diphi,dithe,az1,az2);
[P_Ci,P_Cr] = cissProj(kT,kS,Jex,D,B0,u,diphi,dithe,az1,az2);
Copmt=ctranspose(Copm);

trl=[];
spincons = spin_cst();
a1=[];

for k1 = 1:length(t1)
    
    t=t1(k1);    
    
    rho1 = (expm(-1i*Copm*t)*P_Ci*expm(1i*Copmt*t));
    %rho2 =  round(rho1,7);
    %s= expm(1i*diphi*(spincons(:,:,3) + spincons(:,:,6)))*rho1*expm(-1i*diphi*(spincons(:,:,3) + spincons(:,:,6)));
    %s1=round(s,7);
    %rho=expm(1i*dithe*(spincons(:,:,2) + spincons(:,:,5)))*s*expm(-1i*dithe*(spincons(:,:,2) + spincons(:,:,5)));
    %rho5=round(rho,7);
    X1=PartialTrace(rho1,3,[2,2,3,2]);
    tr=trace(rho1);
    X=X1/tr;
    %X2=round(X,7);
   
  

    e1=X*P_C;
    e2=(trace(e1));
    trl=[trl;e2];
    %trace(X);


    %[vec,val]=eig(X);
    %val=diag(diag(X));
    
    %a3=[a3;ent1];

    end

%plot(t1,trl);
plot(t1,a1)