% This is Matlab, Build 20190215.3
% By Luke H. Zhao, Duke Econ

function[ep]=LogitExpectedLL(b1,b2)
   
    function[lbd]=Lambda(x)% Define Logistic CDF
    lbd=exp(x)/(1+exp(x));
    end

[m1,n1]=size(b1);
[m2,n2]=size(b2);

if n1==1 && n2==1 %Demension checking
    ep=zeros(m1,m2);%Initializing
    p0=exp(1)/(1+exp(1));
    p1=exp(3)/(1+exp(3));
    for i=1:m1
        for j=1:m2
            a=b1(i);
            b=b2(j);
            y1=1-Lambda(a+b);
            z1=Lambda(a+b);
            y0=1-Lambda(a);
            z0=Lambda(a);
            ep1=log(y1)+p1*log(z1/y1);
            ep0=log(y0)+p0*log(z0/y0);
            ep(i,j)=0.35*ep1+0.65*ep0;
        end
    end
else
    disp('input should be vector')
end
end
