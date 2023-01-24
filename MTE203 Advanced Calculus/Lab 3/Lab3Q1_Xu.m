clc, clear, close all 

syms t; 

x=(1/3)*t;
y=sqrt(2)*t;
z=t.^2-(1/2)*t; 

%Plot
fplot3(x,y,z,'r-', [-2, 3])

xlabel('x');
ylabel('y');
zlabel('z'); 
legend('Path');
title("Path")