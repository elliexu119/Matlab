clc, clear, close all 


diameter = [3, 2, 1];
radius = diameter./2./100; % to meters 

length = [10, 15, 20];
length = length./100; % to meters 

%% data and formulas  
e = 69000000000;
p = 2700; 
area = pi.*radius.^2;
k = area.*e./length;
force = [-1000, 0, 0, 1000];

%% matrices
a = [-k(1) 0 0; k(2)+k(1) -k(2) 0; 0 -k(3) k(3)];
b = [force(1); force(2); force(4)];

%% calculations
displacement = [0; linsolve(a,b)]
stress = 1000./area
strain = [displacement(2)/length(1); (displacement(3)-displacement(2))/length(2); (displacement(4)-displacement(3))/length(3)]