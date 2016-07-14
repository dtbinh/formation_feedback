phi = pi;
theta = pi/8;
psi = pi/2;

phi_dot = 0;
theta_dot = 1;
psi_dot = 0.4;



% rotational matrix Rz
    Dz = [cos(psi) -sin(psi) 0
        sin(psi)  cos(psi) 0
        0   0    1];
    
    % rotational matrix Ry
    Dy = [cos(theta)  0   sin(theta)
        0      1      0
        -sin(theta)  0   cos(theta)];
    
    % rotational matrix Rx
    Dx = [1     0         0
        0  cos(phi) -sin(phi)
        0  sin(phi)  cos(phi)];
    
    
    rot = [cos(psi)*cos(theta) -sin(psi)    0
        sin(psi)*cos(theta)     cos(psi)    0
        -sin(theta)              0           1]
    
    ans1 = Dz*Dy*[phi_dot; 0; 0] + Dz*[0; theta_dot; 0] + [0; 0; psi_dot]
    
    ans2 = rot*[phi_dot;theta_dot;psi_dot]