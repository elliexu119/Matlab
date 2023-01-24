clc, clear, close all 

%% data 
data = [0.215, 0.02, 0.125, 36, 0.015]; 
data2 = ["yellow", "Case 1"];
%data = [0.385, 0.02, 0.195, 45, 0.025]; 
%data2 = ["cyan", "Case 2"]; 

body_radius = data(1);
t = data(2); 
h = data(3); %h
neck_angle = 90 - data(4); 
d = data(5); 
colour = data2(1); 

%% body
[body_x, body_y, body_z] = sphere; 
body = surf(body_x*body_radius, body_y*body_radius, body_z*body_radius, "FaceColor", colour);
hold on; 

%% neck
% the trig used to derive the equation for the changing radius of the neck.
top_r = h; 
bottom_r = sqrt(body_radius^2-(body_radius-d)^2);
neck_ht = (top_r-bottom_r).*(1/tand(neck_angle)); %neck height
z_offset = body_radius-d; % the distance from the origin to the bottom of the neck. 

r=linspace(top_r,bottom_r,25); % row vector of 25 evenly spaced points between the upper and lower radius.
theta = linspace(0, 2*pi, 25); % row vector of 25 points to create a circle 
[r,theta] = meshgrid(r,theta); % meshgrid for the upper and lower circles  
neck_x = r.*cos(theta); % x in polar 
neck_y = r.*sin(theta); % y in polar 
[neck_z, temp] = meshgrid(linspace(neck_ht, 0, 25), linspace(0, 2*pi, 25)); % meshgrid for the height of the neck
neck_z = neck_z + z_offset; 
neck = mesh(neck_x, neck_y, neck_z, "FaceColor", colour); % final mesh to generate the shape 

% %% head 
% head_radius = h; 
% [head_x, head_y, head_z] = sphere; 
% head_z(head_z<0) = 0; 
% head_offset = body_radius-d+neck_ht; 
% head = surf(head_x*head_radius, head_y*head_radius, head_z*head_radius+head_offset, "FaceColor", colour);

xlabel("X-axis");
ylabel("Y-axis");
zlabel("Z-axis");

title (data2(2)); 

axis equal; 