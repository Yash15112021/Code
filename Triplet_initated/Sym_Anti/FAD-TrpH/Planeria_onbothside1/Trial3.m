theta = 0;
phi = 0;
dithe=pi/4;
diphi=0;
%u=pi/2;
kT =(1e5);
kS =(1e7);
Jex = (0)*1e-3;
D = (-0)*1e-3;
B_l=[0:1000/50:1000];

u=pi/2;
thetal = [0:pi/50:pi];
phil = [0:2*pi/20:2*pi];
l=[];

tic

    for k11=1:1
        phi=0;
        for k12=1:51
            theta=thetal(k12);
            
            rec_yield_l=[];

            for k2=1:51
                B0=B_l(k2)*1e-6;
                rec_yield = recom_yield(kT,kS,Jex,D,B0,u,diphi,dithe,theta, phi);
                rec_yield_l(k2)=abs(rec_yield);
                
    
            end
    a1=rec_yield_l(3);
    a2=rec_yield_l(11);
    a3=rec_yield_l(26);
    l1=a3/a2;
    l2= a3/a1;
    l3= a1/a2;
    if (a3>a2) && (a3>a1) && (a1>a2)
         fprintf('%s theta,%s phi,%s u,%s l1,%s l2,%s l3  \n',theta,phi,u,l1,l2,l3);
        
         plot(B_l,rec_yield_l);
         title("Fig1");
         %ylim([0, 0.5]); 
    hold on
    end
    
        end
    end


hold off
toc
