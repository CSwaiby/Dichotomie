function [solution,nbIteration,maxError] = Dichotomie(p,a,b,maxIter,tolerance)

i=1;
a(i) = a(1);
b(i) = b(1);
c(i) = (a(i)+b(i))/2;
s = 0;
tx = tolerance+1;

[pa] = Horner(p,a(i));
[pb] = Horner(p,b(i));

% Making sure there exists a root on the interval [a,b]:
prod = pa * pb;

if prod > 0
    disp('No root is available on this interval');
    solution = [];
    nbIteration = 0;
    maxError = 0;
% In case both or one of the extremities are the root:
elseif prod == 0
    if pa == 0 && pb ==0
        disp('a and b are both roots of the function');
        solution = [a b];
        nbIteration = 0;
        maxError = 0;
    elseif pa == 0
        solution = a;
        nbIteration = 0;
        maxError = 0;
        disp('a is a root of the function');
    else
        disp('b is a root of the function');
        solution = b;
        nbIteration = 0;
        maxError = 0;
    end
% Didn't take into consideration the uniqueness of the root or I will have 
% to find the derivative and then find the root of that function to find 
% the sign of the derivative function.
else 
    for i=1:maxIter
     if(tx>tolerance)
       [pa] = Horner(p,a(i));
       [pc] = Horner(p,c(i));
         
       if (pa*pc)<0
       a(i+1)=a(i);
       b(i+1)=c(i);
       c(i+1)=(a(i+1)+b(i+1))/2;
       s = c(i+1);
       elseif (pa*pc) == 0
       s = c(i);   
       else
       a(i+1)=c(i);
       b(i+1)=b(i);
       c(i+1)=(a(i+1)+b(i+1))/2;
       s = c(i+1);
       end    
       tx=(b(i+1)-a(i+1))/(2);
     end
    end
    solution = s;
    nbIteration = i-1;
    maxError=tx;
end
end

