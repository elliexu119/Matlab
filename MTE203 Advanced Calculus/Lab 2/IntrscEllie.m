clc, clear, close all 
t = linspace(-1.5, 1.5, 1000);
x = t; 
y = t;
z=(-sin(t.^3+5*t.^3)+sqrt(sin((t.^3)+5.*t.^3).^2-4.*(5.*t.^2+4).*(-5+2.*t.^2)))./(2.*(5.*t.^2+4));

plot3(x, y, z,'-r', 'LineWidth', 3)
xlabel('x')
ylabel('y') 
zlabel('z')