function [iter,X,waktu]=zenodo_gradient_descent(f,df,alpha,init,itmax,tolmax)
tic;
x=zeros(2,itmax);
x(:,1)=init;
for i=1:itmax-1
    x(:,i+1)=x(:,i)-alpha*df(x(1,i),x(2,i));
    % periksa stopping kriteria
    if (norm(df(x(1,i+1),x(2,i+1))))<tolmax
        break;
    end
end
iter=i+1;
X=x(:,1:iter);
waktu=toc;