clc, clear, close all 
[x y]=meshgrid(-1.5:0.01:1.5);
z=(-sin(x.^2.*y+5*x.^3)+sqrt(sin((x.^2).*y + 5.*x.^3).^2-4.*(5.*x.^2+4).*(-5+x.^2+y.^2)))./(2.*(5.*x.^2+4));
surf(x,y,z,'FaceAlpha', 0.5,'EdgeColor', 'none', 'FaceColor', 'black');
hold on 

contour(x,y,z,7, 'ShowText', 'on'); 

clear; 
[x,z]=meshgrid(0.03:0.01:1.14);
y=x; 
surf(x,y,z, 'EdgeColor', 'none', 'FaceColor', 'yellow');

clear; 
t = linspace(-1.5, 1.5, 1000);
x = t; 
y = t;
z=(-sin(t.^3+5*t.^3)+sqrt(sin((t.^3)+5.*t.^3).^2-4.*(5.*t.^2+4).*(-5+2.*t.^2)))./(2.*(5.*t.^2+4));

plot3(x, y, z,'-r', 'LineWidth', 3)

xlabel('x')
ylabel('y') 
zlabel('z')
legend('surface', 'contours', 'plane', 'curve of intersection')
