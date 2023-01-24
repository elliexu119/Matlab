clc, clear, close all 

syms t; 

r=[(1/3)*t; sqrt(2)*t; t.^2-(1/2)*t]; 

v = diff(r, t);
magv = norm(v); 

%% Arc Length 
S = int(magv)
Se = int(magv, -2, 3)
fplot(S, [-2, 3]);
title("Arc Length");
ylabel('S');

T = v./magv 

%% Curvature  
K = 1./magv.*norm(diff(T,t))
fplot(K, [-2, 3]);
title("Curvature");
ylabel('K');

N = diff(T, t)./norm(diff(T, t))

%% Radius of Curvature
P = 1./K
fplot(P, [-2, 3]);
title("Radius of Curvature");
ylabel('P');

%% Tangential Acceleration 
at = diff(magv, t)
fplot(at, [-2, 3]);
title("Tangential Acceleration");
ylabel('At');

% Normal Acceleration 
an = K.*magv.^2
fplot(an, [-2, 3]);
title("Normal Acceleration");
ylabel('An');

%% Acceleration 
a = norm(diff(v, t))
fplot(a, [-2, 3]); 
title ("Acceleration"); 
ylabel('A');

%a = norm((at.*T)+(an.*N))

xlabel('t');