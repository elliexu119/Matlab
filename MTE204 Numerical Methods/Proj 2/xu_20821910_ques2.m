clc, clear, close all 
format long

%% formulas and data
e = 200000000000;
p = 7850; 
area = 0.0004; 
s = @(theta) [cos(theta).^2 cos(theta).*sin(theta) -cos(theta).^2 -cos(theta).*sin(theta); 
            cos(theta).*sin(theta) sin(theta).^2 -cos(theta).*sin(theta) -sin(theta).^2;
            -cos(theta).^2 -cos(theta).*sin(theta) cos(theta).^2 cos(theta).*sin(theta);
            -cos(theta).*sin(theta) -sin(theta).^2 cos(theta).*sin(theta) sin(theta).^2;];

k = @(l) (e.*area)./l;
length = [4 sqrt(8) sqrt(8) 2]; 
angle = [0 -pi./4, pi./4 0];

%% element matrices 
member4 = [1 0 -1 0 0 0 0 0;
            0 0 0 0 0 0 0 0; 
            -1 0 1 0 0 0 0 0; 
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0; ]*k(length(4));

member2 = [ 0 0 0 0 0 0 0 0;
            0 1/2 -1/2 0 0 -1/2 1/2 0; 
            0 -1/2 1/2 0 0 1/2 -1/2 0; 
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 -1/2 1/2 0 0 1/2 -1/2 0; 
            0 1/2 -1/2 0 0 -1/2 1/2 0;
            0 0 0 0 0 0 0 0; ] *k(length(2));

member3 = [ 0 0 0 0 0 0 0 0;
            0 1/2 1/2 -1/2 -1/2 0 0 0; 
            0 1/2 1/2 -1/2 -1/2 0 0 0; 
            0 -1/2 -1/2 1/2 1/2 0 0 0;
            0 -1/2 -1/2 1/2 1/2 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0; ]*k(length(3));

member1 = [ 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 1 0 -1 0;
            0 0 0 0 0 0 0 0;
            0 0 0 0 -1 0 1 0;
            0 0 0 0 0 0 0 0; ]*k(length(1));

%% calculations 
members = member1 + member2 + member3 + member4; % global matrix 

% matrix operations 
x = [members(2, :); members(3, :); members(6, :); members(7, :)];
a = [x(:, 2) x(:, 3) x(:, 6) x(:, 7)];
b = [0; 0; -50000; 0]; 
c = linsolve(a, b); 

displacement = [0; c(1); c(2); 0; 0; c(3); c(4); 0] % displacement of all points 

% calculate change in length using trig 
change_l = @(m, x1, x2, y1, y2) norm([length(m)*cos(angle(m))+displacement(x1)-displacement(x2) length(m)*sin(angle(m))+displacement(y1)-displacement(y2)])-length(m);
change_in_length = [change_l(1, 5, 7, 4, 6); change_l(2, 3, 7, 2, 6); change_l(3, 5, 3, 4, 2); change_l(4, 1, 3, 8, 2)]

% calculate strain 
strain_cal = @(x) change_in_length(x)/length(x); 
strain = [strain_cal(1); strain_cal(2); strain_cal(3); strain_cal(4)]

% calculate forces using trig 
p = @(m, x1, x2, y1, y2) k(length(m))*[-cos(angle(m)) -sin(angle(m)) cos(angle(m)) sin(angle(m))]*[displacement(x1); displacement(y1); displacement(x2); displacement(y2)];
forces = [p(1, 5, 7, 4, 6) p(2, 3, 7, 2, 6) p(3, 5, 3, 4, 2) p(4, 1, 3, 8, 2)]

% calculate stress 
stress = forces/area