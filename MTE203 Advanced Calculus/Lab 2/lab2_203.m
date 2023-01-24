%% p1 plot
clc, clear, close all 

x = (-2*pi:4*pi/100:2*pi);
y1= sin(x); 
figure; 
%plot(x, y1); 
%hold on; 
y2 = cos(x);
%plot(x, y2); 

plot(x, y1, '-r', 'LineWidth', 2)
hold on
plot(x, y2, '--b', 'LineWidth', 2)
xlabel('X');
ylabel('F(x)')
legend('y1=sin(x)','y2=cos(x)')

%% p2 plot 
clc, clear, close all 

x = -2:0.05:2; 
y = -2:0.05:2; 
[x,y]=meshgrid(x, y);

z = exp(sin(x).^2+sin(y).^2);
contour(x,y,z, 50, 'ShowText', 'off'); 
colorbar;

xlabel('x');
ylabel('y');



%% p3 plot
clc, clear, close all 

% define the t increments 
t = 0:0.05*pi:10*pi; 
% Define x, y and z
x=cos(t);
y=sin(t);
z=0.5.*t;
%Plot
plot3(x,y,z,'r-')

xlabel('x');
ylabel('y');
zlabel('z'); 
legend('legend')
%% p4 plot 
clc, clear, close all 
%make rectangular grid on the x-y plane
[x y]=meshgrid(-1.5:0.01:1.5);
%calculate x y at all x y values
%z=(sin(sqrt(x.^2+y.^2)))./(sqrt(x.^2+y.^2));
z=(-sin(x.^2.*y+5*x.^3)+sqrt(sin((x.^2).*y + 5.*x.^2).^2-4.*(25.*x.^2+4).*(-5+x.^2+y.^2)))./(2.*(25.*x.^2+4));
%plot the surface and level curves
%surf(x,y,z)
figure 
alpha 0.5
surf(x,y,z,'FaceAlpha', 0.5,'EdgeColor', 'none', 'FaceColor', 'black')
hold on 
contour(x,y,z, 5); 
