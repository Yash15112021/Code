function spin_cons = spin_cst()

S_x = [0 0.5;0.5 0]; 
S_y = [0 -0.5i;0.5i 0]; 
S_z = [0.5 0;0 -0.5];
spin_cons=[];
spin_cons(:,:,1) = kron(S_x,eye(18));
spin_cons(:,:,2) = kron(S_y,eye(18));
spin_cons(:,:,3) = kron(S_z,eye(18));
spin_cons(:,:,4) = makron(eye(2),S_x,eye(9));
spin_cons(:,:,5) = makron(eye(2),S_y,eye(9));
spin_cons(:,:,6) = makron(eye(2),S_z,eye(9));

end
