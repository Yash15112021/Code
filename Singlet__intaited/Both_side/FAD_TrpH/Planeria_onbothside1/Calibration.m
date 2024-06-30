theta = 0;
phi = 0;
dithe=pi/4;
diphi=0;
%u=pi/2;
kT =(1e4);
kS =(1e7);
Jex = (0)*1e-3;
D = (-0.4)*1e-3;

%B_l=[0:1000/5:1000];
B_l=[40,200,500];
%az_l=[0:1/50:1];
%az1_l=[0.6888100];
%az4_l=[0.2251000];


az1_l=[0.5233];
%az1_l=[0.4313000];
az4_l=[0.3215];
%az4_l=[0.3986200];
%u_l=[0:pi/10:pi/2];
u_l=[pi/2];
%u_l=[0,pi/6,pi/4,pi/3,pi/2];
%u_l=[0:pi/100:pi/2];
%u_l=[pi/3];
l=[];
y1_l= [];
y2_l= [];
y3_l= [];
tic
for f13=1:1
    u=u_l(f13);
    for k11=1:1
        for k12=1:1
            az1=az1_l(k11);
            az4=az4_l(k12);
            rec_yield_l=[];

            for k2=1:3
                B0=B_l(k2)*1e-6;
                rec_yield = recom_yield(kT,kS,Jex,D,B0,u,diphi,dithe,az1,az4,theta, phi);
                rec_yield_l(k2)=abs(rec_yield)
    
            end
    
    
        end
    end
end

l=ctranspose(l);
y=[y1_l y2_l y3_l];
%hold off
toc
