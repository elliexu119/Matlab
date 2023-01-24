clc, clear, close all 
[x,z]=meshgrid(0.03:0.01:1.14);
y=x; 
surf(x,y,z, 'EdgeColor', 'none', 'FaceColor', 'yellow');
hold on 
contour(x,y,z,7, 'ShowText', 'on'); 
xlabel('x')
ylabel('y') 
zlabel('z')