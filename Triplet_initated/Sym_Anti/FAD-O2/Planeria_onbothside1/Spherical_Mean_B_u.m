theta = 0;
phi = 0;
dithe=pi/4;
diphi=0;
%u=pi/2;
kT =(1e4);
kS =(1e7);
Jex = (0)*1e-3;
D = (-0.4)*1e-3;
B_l=[0:1000/50:1000];
%u_l=[0,pi/6,pi/4,pi/3,pi/2];
u_l=[0:pi/80:pi/2];
%u=0;
l1_l=[];
l2_l=[];
l3_l=[];
l=[];
tic
parfor f13=1:41
    u=u_l(f13);
    rec_yield_l=[];
for k2=1:51
                B0=B_l(k2)*1e-6;
                rec_yield = Spherical_Mean(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi);
                rec_yield_l(k2)=(rec_yield);
                
    
            end

    a1=rec_yield_l(3);
    a2=rec_yield_l(11);
    a3=rec_yield_l(26);
    l1=a3/a2;
    l2= a3/a1;
    l3= a1/a2;
    
    l=[rec_yield_l;l];

    %if (a3>a2) && (a3>a1) && (a1>a2)
         %fprintf('%s theta,%s phi,%s u,%s l1,%s l2,%s l3  \n',theta,phi,u,l1,l2,l3);
    l1_l=[l1_l;l1];
    l2_l=[l2_l;l2];
    l3_l=[l3_l;l3];
         %plot(B_l,rec_yield_l);
         %title("Fig1");
         %ylim([0, 0.5]); 
    
    end
    
    y=[l1_l l2_l l3_l];
toc