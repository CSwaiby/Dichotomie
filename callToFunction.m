clc; clear;
degree=0; a=[]; b=[];

%Request polynomial function degree from user
degree = input ('Enter the degree of the function: ') + 1;
while degree==0
disp('Please enter a number!')
degree = input ('Enter the degree of the function: ') + 1;
end

coefs = zeros(1,degree);
%Request polynomial function coefficients from user
for i =1:degree
    switch i
        case 1
            coefs(1) = input ('Enter the 1st coefficient of your polynomial function: ');
        case 2
            coefs(2) = input ('Enter the 2nd coefficient of your polynomial function: ');
        case 3
            coefs(3) = input ('Enter the 3rd coefficient of your polynomial function: ');
        otherwise
            coefs(i) = input (['Enter the ' num2str(i) 'th coefficient of your polynomial function: ']);
    end
end

%Request search interval from user
a = input ('Enter "a" the left side extremity of the interval: ');
while isempty(a)
disp('Please enter a number!')
a = input ('Enter "a" the left side extremity of the interval: ');
end

b = input ('Enter "b" the right side extremity of the interval: ');
while isempty(b)
disp('Please enter a number!')
b = input ('Enter "b" the right side extremity of the interval: ');
end

%Request maximum number of iterations from user
maxIterations = input ('Enter the maximum number of iterations: ');

%Request tolerance from user
tolerance = input ('Enter the tolerance: ');

%Find the root using Dichotomie function 
[root , nbIteration , precision] = Dichotomie(coefs ,a, b, maxIterations,tolerance);
if isempty(root)
    
else
disp(['The root is ' num2str(root) ' found after ' num2str(nbIteration) ' iterations and at a precision of ' num2str(precision)]);
end