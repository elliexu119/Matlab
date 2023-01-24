clc, clear, close all 

%% ques a
% constants 
g = 6.67e-11; 
m = 1.3e20; 

rx = @(x, y) (-x-2500)./(sqrt((-x-2500).^2+(-y-1000).^2)); % anonymous func for x-component
ry = @(x, y) (-y-1000)./(sqrt((-x-2500).^2+(-y-1000).^2)); % anonymous func for y-component

f_mag = @(x, y) (g.*m)./((-x-2500).^2+(-y-1000).^2); % anonymous func for the force magnitude 

%% ques b 
% parametric equation of the Falcon's path 
syms t
falx = @(a) 3500.*cos(a)-2500; 
faly = @(a) 3500.*sin(a); 

% plotting the gravitational field 
[X,Y] = meshgrid(-6000:500:6000,0:500:10000); % between -6000 and 6000
quiver(X, Y, f_mag(X, Y).*rx(X, Y), f_mag(X, Y).*ry(X, Y), 1);
hold on

% plotting the Falcon's path and some key points 
fplot(falx(t), faly(t), [0, 2.5]); 
plot(falx(0), faly(0), 'o-', 'MarkerFaceColor','red');
plot(falx(1.6), faly(1.6), 'o-', 'MarkerFaceColor','yellow');
plot(falx(2.5), faly(2.5), 'o-', 'MarkerFaceColor','blue');


%% ques c
r = [falx(t), faly(t)]; % combining the parametric equation into one vector
r_d = diff(r); % finding the derivative with respect to t 
f = [f_mag(falx(t), faly(t)).*rx(falx(t), faly(t)), f_mag(falx(t), faly(t)).*ry(falx(t), faly(t))]; % force 
%finding work 
work1 = int(dot(f, r_d), t, 0, 2.5) % from 0 to 2.5
work2 = int(dot(f, r_d), t, 1.6, 2.5) % from 1.6 to 2.5 


%% ques d
reyy = @(a) 3500.*sin(a)-1500.*a.^2+3750*a; % new path 
fplot(falx(t), reyy(t), [0, 2.5]); % plotting the new path from 0 to 2.5 
f2 = [f_mag(falx(t), reyy(t)).*rx(falx(t), reyy(t)), f_mag(falx(t), reyy(t)).*ry(falx(t), reyy(t))]; % force for new path
work3 = vpaintegral(dot(f2, diff([falx(t), reyy(t)])), t, 0, 2.5) % calculating the new work 

%% labels 
xlabel("x-axis");
ylabel("y-axis");
legend('Gravitational field', 'Original', 't=start', 't=1.6', 't=end', 'Rey');
title("Path");
