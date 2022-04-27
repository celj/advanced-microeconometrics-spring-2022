% Date: 23-04-2022
% Purpose: Optimize the log-likelihood for our extended Roy model

clear 
randn('seed',12345)
global y D X Z W T


% load data
data=readmatrix('datos_mod.csv');

ones=ones(size(data,1),1);

% t1 t2 t3 D Y Q X Z
t1=data(:,1);
t2=data(:,2);
t3=data(:,3);
t4=data(:,4);
T=[t1 t2 t3 t4];
D=data(:,5);
y=data(:,6);
W=[ones data(:,7:20)];
X=[ones data(:,21:23)];
Z=[ones data(:,24:28)];

% Starting values for the betas

% Measuring system
beta_start_T1=inv(W'W)(W'*T(:,1));
sigma_start_T1=sqrt(((T(:,1)-W*beta_start_T1)'*(T(:,1)-W*beta_start_T1))/(size(T,1)-size(W,2)));

beta_start_T2=inv(W'W)(W'*T(:,2));
sigma_start_T2=sqrt(((T(:,2)-W*beta_start_T2)'*(T(:,2)-W*beta_start_T2))/(size(T,1)-size(W,2)));
alpha_start_T2=1;

beta_start_T3=inv(W'W)(W'*T(:,3));
sigma_start_T3=sqrt(((T(:,3)-W*beta_start_T3)'*(T(:,3)-W*beta_start_T3))/(size(T,1)-size(W,2)));
alpha_start_T3=1;

beta_start_T4=inv(W'W)(W'*T(:,4));
sigma_start_T4=sqrt(((T(:,4)-W*beta_start_T4)'*(T(:,4)-W*beta_start_T4))/(size(T,1)-size(W,2)));
alpha_start_T4=1;

sigma_theta1_start=1;
sigma_theta2_start=1;


betas_start_1s=[beta_start_T1; beta_start_T2 ; beta_start_T3; beta_start_T4;...
    alpha_start_T2;alpha_start_T3; alpha_start_T4;...
    sigma_start_T1; sigma_start_T2; sigma_start_T3 ; sigma_start_T4; sigma_theta1_start];

% Rest of the parameters
beta_start_D=inv(Z'Z)(Z'*D);
alphav_start=1;

beta_start_y1=inv(X'X)(X'*y);
sigma_start_y1=sqrt(((y-X*beta_start_y1)'*(y-X*beta_start_y1))/(size(y,1)-size(X,2)));
alpha1_start=1;

beta_start_y0=inv(X'X)(X'*y);
sigma_start_y0=sqrt(((y-X*beta_start_y0)'*(y-X*beta_start_y0))/(size(y,1)-size(X,2)));
alpha0_start=1;

betas_start_2s=[beta_start_D; alphav_start ;beta_start_y1 ;alpha1_start;...
    beta_start_y0;alpha0_start ; sigma_start_y1 ; sigma_start_y0];


% Optimization - all at once
betas_start=[betas_start_1s ; betas_start_2s];

of=llik_roy(betas_start)

tic
options = optimoptions(@fminunc,'Algorithm','quasi-newton','Display','iter',...
    'GradObj','off','HessUpdate','bfgs','UseParallel',false,...
    'TolFun',1e-6,'TolX',1e-6,'MaxIter',1e6,'MaxFunEvals',1e6);
[beta_est,fval,exitflag,output,grad,hessian] = fminunc('llik_roy',betas_start,options);
runtime=toc

se_H=sqrt(diag(inv(hessian)));

[beta_est se_H]


function f=llik_roy(betas)
% Date: 23-04-2022
% Purpose: computes the sample model for the session

global  y D X Z W T

nW=size(W,2);
nX=size(W,2);
nZ=size(W,2);

omega1=betas(1:nW,1);
omega2=betas(nW+1:nW+nW,1);
omega3=betas(nW+nW+1:nW+nW+nW,1);
omega4=betas(nW+nW+nW+1:nW+nW+nW+nW,1);
alphat2=betas(nW+nW+nW+nW+1,1);
alphat3=betas(nW+nW+nW+nW+1+1,1);
alphat4=betas(nW+nW+nW+nW+1+1+1,1);
sigma_t1=betas(nW+nW+nW+nW+1+1+1+1,1);
sigma_t2=betas(nW+nW+nW+nW+1+1+1+1+1,1);
sigma_t3=betas(nW+nW+nW+nW+1+1+1+1+1+1,1);
sigma_t4=betas(nW+nW+nW+nW+1+1+1+1+1+1+1,1);
sigma_theta1=betas(nW+nW+nW+nW+1+1+1+1+1+1+1+1);

colZ=size(Z,2);
colX=size(X,2);

gamma=betas(4*nW+7+1:4*nW+7+colZ,1);
alphaI=betas(4*nW+7+colZ+1,1);
beta1=betas(4*nW+7+colZ+1+1:4*nW+7+colZ+1+colX,1);
alpha1=betas(4*nW+7+colZ+1+colX+1,1);
beta0=betas(4*nW+7+colZ+1+colX+1+1:4*nW+7+colZ+1+colX+1+colX,1);
alpha0=betas(4*nW+7+colZ+1+colX+1+colX+1,1);
sigma1=betas(4*nW+7+colZ+1+colX+1+colX+1+1,1);
sigma0=betas(4*nW+7+colZ+1+colX+1+colX+1+1+1,1);

fun=@(x) (normpdf(y- X*beta1 - x*alpha1,0,exp(sigma1)).*normcdf(Z*gamma + x*alphaI ,0,1) ).^D...
    .(normpdf(y- X*beta0 - x*alpha0,0,exp(sigma0)).(1-normcdf(Z*gamma + x*alphaI ,0,1)) ).^(1-D)...
    .*normpdf(T(:,1)- W*omega1 - x,0,exp(sigma_t1))...
    .*normpdf(T(:,2)- W*omega2 - x*alphat2,0,exp(sigma_t2))...
    .*normpdf(T(:,3)- W*omega3 - x*alphat3,0,exp(sigma_t3))...
    .*normpdf(T(:,4)- W*omega4 - x*alphat4,0,exp(sigma_t4))...
    .*normpdf(x,0,exp(sigma_theta1));

q = integral(fun,-Inf,Inf,'ArrayValued',true);

f=-sum(log(q));
