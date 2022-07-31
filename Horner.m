function [pz,ppz]=Horner(p,z)
%p is a vector which elements are the coefficients of the polynomial
%polynomial form=p(1)*x^(n)+p(2)*x^(n-1)+...+p(n)*x+p(n+1)
a(1)=p(1);b(1)=a(1);

for i=2:length(p)
    a(i)=a(i-1)*z+p(i);
    b(i)=b(i-1)*z+a(i);
end
pz=a(length(p));
ppz=b(length(p)-1);