function [iter,X,waktu]=zenodo_newton(f,grad,H,init,itmax,tolmax)
tic;
x=zeros(2,itmax);
x(:,1)=init;
for i=1:itmax-1
    x(:,i+1)=x(:,i)-H(x(1,i),x(2,i))\grad(x(1,i),x(2,i));
    % periksa stopping kriteria
    if (norm(grad(x(1,i+1),x(2,i+1))))<tolmax
        break;
    end
end
iter=i+1;
X=x(:,1:iter);
waktu=toc;