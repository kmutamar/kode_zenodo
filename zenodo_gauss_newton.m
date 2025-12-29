function [iter,X,waktu]=zenodo_gauss_newton(f,res,jac,init,itmax,tolmax)
tic;
x=zeros(2,itmax);
x(:,1)=init;
for i=1:itmax-1
    delta=-(jac(x(1,i),x(2,i))'*jac(x(1,i),x(2,i)))...
        \(jac(x(1,i),x(2,i))*res(x(1,i),x(2,i)));
    x(:,i+1)=x(:,i)+delta;
    % periksa stopping kriteria
    if norm(res(x(1,i+1),x(2,i+1)))<tolmax
        break;
    end
end
iter=i+1;
X=x(:,1:iter);
waktu=toc;