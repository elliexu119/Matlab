clc, clear, close all 
[x y]=meshgrid(-1.5:0.01:1.5);
z=(-sin(x.^2.*y+5*x.^3)+sqrt(sin((x.^2).*y + 5.*x.^3).^2-4.*(5.*x.^2+4).*(-5+x.^2+y.^2)))./(2.*(5.*x.^2+4));
contour(x,y,z,7, 'ShowText', 'on'); 
xlabel('x')
ylabel('y') 