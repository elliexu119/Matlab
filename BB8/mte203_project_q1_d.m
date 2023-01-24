clc, clear, close all 

syms R z theta 
syms p phi

data = [0.215, 0.02, 0.125, 36, 0.015]; 
%data = [0.385, 0.02, 0.195, 45, 0.025]; 

r = data(1);
t = data(2); 
h = data(3); 
angle = data(4); 
d = data(5); 

%% triple integrals to find volumes 
v_head = round(int(int(int(R, z, -sqrt(h^2-R^2), sqrt(h^2-R^2)), R, 0, h), theta, pi, 2*pi), 5)
v_body = round(int(int(int(p^2*sin(phi), p, r - t, r), phi, 0, pi), theta, 0, 2*pi), 5)
v_socket = round(int(int(int(R, z, r-d, sqrt(r^2-R^2)), R, 0, sqrt(2*r*d-d^2)), theta, 0, 2*pi), 5)
v_neck = round(int(int(int(R, R, 0, sqrt(2*r*d-d^2)+z/tand(angle)), z, 0, (h-sqrt(2*r*d-d^2))*tand(angle)), theta, 0, 2*pi), 5)
v_total = round(v_head+v_body+v_neck-v_socket, 5)
