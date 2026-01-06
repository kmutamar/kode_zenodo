clear all;
close all;
clc;
warning('off','all')
init=[10,10];
itmax=1e5;
tolmax=1e-5;
alpha=0.25;
lambda=0.25;
%% simulasi fungsi 1
[iterN,solN,waktuN]=zenodo_newton(@zenodo_f1,@zenodo_df1,@zenodo_H1,init,itmax,tolmax);
[iterGD,solGD,waktuGD]=zenodo_gradient_descent(@zenodo_f1,@zenodo_df1,alpha,init,itmax,tolmax);
[iterGN,solGN,waktuGN]=zenodo_gauss_newton(@zenodo_f1,@zenodo_residu1,@zenodo_residu_jac1,init,itmax,tolmax);
[iterLM,solLM,waktuLM]=zenodo_levenberg(@zenodo_f1,@zenodo_residu1,@zenodo_residu_jac1,lambda,init,itmax,tolmax);

disp(['Iterasi = ',num2str([iterN,iterGD,iterGN,iterLM])])
disp(['Waktu   = ',num2str([waktuN,waktuGD,waktuGN,waktuLM])])
disp('=========================================================')

%% simulasi fungsi2
[iterN,solN,waktuN]=zenodo_newton(@zenodo_f2,@zenodo_df2,@zenodo_H2,init,itmax,tolmax);
[iterGD,solGD,waktuGD]=zenodo_gradient_descent(@zenodo_f2,@zenodo_df2,alpha,init,itmax,tolmax);
[iterGN,solGN,waktuGN]=zenodo_gauss_newton(@zenodo_f2,@zenodo_residu2,@zenodo_residu_jac2,init,itmax,tolmax);
[iterLM,solLM,waktuLM]=zenodo_levenberg(@zenodo_f2,@zenodo_residu2,@zenodo_residu_jac2,lambda,init,itmax,tolmax);
[iterLM2,solLM2,waktuLM2]=zenodo_levenberg_new(@zenodo_f2,@zenodo_residu2,@zenodo_residu_jac2,lambda,init,itmax,tolmax);

disp(['Iterasi = ',num2str([iterN,iterGD,iterGN,iterLM,iterLM2])])
disp(['Waktu   = ',num2str([waktuN,waktuGD,waktuGN,waktuLM,waktuLM2])])