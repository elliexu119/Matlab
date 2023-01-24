clc, clear, close all 

syms t; 

g = 4*t.^3-t;
u = [t;t.^2; 2*t];
v = [1; -2*t; 3*t.^2];

f = 5*g*(u+v)
int(f)