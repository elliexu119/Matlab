clc, clear, close all 

syms a b x y

f = a*(x*sin(x*y.^2))/(exp(x*y.^2)+(1+y.^2)/(x*y.^2))+b*x*y.^2;

dfdx = diff(f, x)
dfdy = diff(f, y)
dfdxdy = diff(dfdx, y)
dfdydx = diff(dfdy, x)