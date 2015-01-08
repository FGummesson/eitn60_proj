function [e,w]=lms(mu,M,u,d);
%           Call:
%           [e,w]=lms(mu,M,u,d);
%
%           Input arguments:
%           mu      = step size, dim 1x1
%           M       = filter length, dim 1x1
%           u       = input signal, dim Nx1
%           d       = desired signal, dim Nx1    
%
%           Output arguments:
%           e       = estimation error, dim Nx1
%           w       = final filter coefficients, dim Mx1

%initial weights
w=zeros(M,1);

%length of input signal
N=length(d);

%make sure that u and d are colon vectors
u=u(:);
d=d(:);

%LMS
for n=M:N
    uvec=u(n:-1:n-M+1);
    e(n)=d(n)-w'*uvec;  
    w=w+mu*uvec*conj(e(n));
end
e=e(:);
