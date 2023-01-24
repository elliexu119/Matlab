clc, clear, close all 

syms theta r y
syms p phi

data = [0.215, 0.02, 0.125, 36, 0.015]; 
weight = [-0.2, -0.09];
%data = [0.385, 0.02, 0.195, 45, 0.025]; 
%weight = [-0.29, -0.11];

R = data(1);
t = data(2); 
h = data(3); 
angle = data(4) * pi/180; 
d = data(5); 

%% head 
density = 225 + 15*(cos(theta + pi/2)-sin(theta));
Mh = int(int(int(density * r, y, -sqrt(h^2-r^2), sqrt(h^2-r^2)), r, 0, h), theta, 0, pi);
Mhyz = int(int(int(r^2*cos(theta)*density, y, -sqrt(h^2-r^2), sqrt(h^2-r^2)), r, 0, h), theta, 0, pi);
Mhxy = int(int(int(r*sin(theta)*r*density, y, -sqrt(h^2-r^2), sqrt(h^2-r^2)), r, 0, h), theta, 0, pi);
Xh = Mhyz/Mh;

bottom_r = sqrt(R^2-(R-d)^2);
neck = (h-bottom_r).*(tan(angle)); %neck height
Zh = Mhxy/Mh + R - d + neck; % the z-center of mass and plus the distance from the origin

%% body
density = 300;
Mb = int(int(int(300*p^2*sin(phi), p, R - t, R), phi, 0, pi), theta, 0, 2*pi);
Mbyz = int(int(int(300*p^2*sin(phi)*p*sin(phi)*cos(theta), p, R - t, R), phi, 0, pi), theta, 0, 2*pi);
Mbxy = int(int(int(300*p^2*sin(phi)*p*cos(phi), p, R - t, R), phi, 0, pi), theta, 0, 2*pi);
Xb = Mbyz/Mb;
Zb = Mbxy/Mb;

%% weight 
Xw = weight(1);
Zw = weight(2); 
Mw = 40; 

%% total 

x = (Mh*Xh+Mb*Xb+Mw*Xw)/(Mh+Mb+Mw);
y = 0;
z = (Mh*Zh+Mb*Zb+Mw*Zw)/(Mh+Mb+Mw);

% display data in a friendly way 
round(x, 7)
round(z, 7)

%% torque 
gravity = 9.81; 
mass = Mb + Mh + Mw; 

torque = round(abs(x)*gravity*mass - (R-abs(z))*0.25*9.81*mass, 7) 
