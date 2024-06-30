function H_hf = hyperfine()
    % FAD hyperfine tensors
    FAD = 0.4313*eye(3) *1e-3;
    FAD1 = 0.2506*eye(3)* 1e-3;

    %Other molecule is O2 here
    S_x = [0 0.5; 0.5 0]; 
    S_y = [0 -0.5i; 0.5i 0]; 
    S_z = [0.5 0; 0 -0.5];
    I_x = (1/sqrt(2)) * [0 1 0; 1 0 1; 0 1 0];
    I_y = (1/sqrt(2)) * [0 -1i 0; 1i 0 -1i; 0 1i 0];
    I_z = [1 0 0; 0 0 0; 0 0 -1];

  

    H_hf =   FAD(1,1)*makron(S_x,eye(2),I_x,eye(3)) +FAD(2,2)*makron(S_y,eye(2),I_y,eye(3)) + FAD(3,3)*makron(S_z,eye(2),I_z,eye(3))+...
             FAD1(1,1)*makron(S_x,eye(2),eye(3),I_x)+FAD1(2,2)*makron(S_y,eye(2),eye(3),I_y) + FAD1(3,3)*makron(S_z,eye(2),eye(3),I_z);
end
