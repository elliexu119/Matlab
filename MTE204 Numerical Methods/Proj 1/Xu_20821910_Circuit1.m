clear;
close all;
clc;

% Input A Matrix
A = [ 1 1 0 0 1 0;
      0 -18 -2 -5 5 0;
      0 -1 1 0 0 0;
      0 0 -1 1 0 0;
      0 0 0 -1 -1 1;
      35 0 0 0 -5 -35];
  
% Input B Matrix  
B = [ 0
      0
      0
      0
      0
      190 ];

%initial values 
X = [0, 0, 0, 0, 0, 0];

%relaxation parameter 
w = 0.2; 

error = 100; 
iterations = 0; 

while error > (10^-6)
    iterations = iterations + 1; 

    %initialize error array 
    errors = zeros(length(A), 1); 

    for row = 1:length(A) %iterate through the rows 
        prev = X(row); 
        X(row) = B(row); 
       for col = 1:length(A) %iterate through the columns 
           if col ~= row
               X(row) = X(row) - A(row, col) * X(col);
           end
       end

       %apply relaxation parameter 
       X(row) = (X(row) / A(row, row)) * w + (1-w)*prev;
        
       %add error to the error array 
       errors(row) = ((X(row)-prev)/X(row))*100;
    end 
    error = max(errors); 
end 

%print results
iterations
X
linsolve(A,B)