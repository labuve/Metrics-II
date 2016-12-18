%% Problem Set 3
% Econometrics
% Fatima and Johanna

clear all
clc
%% Question 4 (sample size = 100)

% Parameters
t = 100; % sample size
N = 10000; % number of simulations

% Creating the sample of random walk processes
epsilon = randn(t, N);
eta = randn(t, N);
X = cumsum(eta);
Y = cumsum(epsilon);

% Calculating the distribution of the OLS estimator
beta = sum(X.*Y)./sum(X.^2);

% Plotting the distribution of the estimator
figure(1)
histogram(beta, 100, 'Normalization','probability')
xlabel('$\hat{\beta}^{OLS}$','Interpreter','LaTex')
ylabel('Probability')
xlim([-6 6])
ylim([0 0.07])
title(['Distribution of OLS estimator (n = ', num2str(t),')'])
print('fig1','-depsc')

% Calculating distribution of t-statistics and Durbin-Watson statistics
res = Y - beta.*X;
ssr = sum(res.*res);
tstat = beta./sqrt((1/t*ssr)./sum(X.^2));

reslag = res;
reslag(t,:) = [];
resdup = res;
resdup(1,:) = [];

resdif = resdup - reslag;
numer3 = sum(resdif.*resdif);
DW = numer3./ssr;

figure(2)
histogram(tstat, 100, 'Normalization','probability')
xlabel('$t_{\beta = 0}$','Interpreter','LaTex')
ylabel('Probability')
xlim([-200 200])
ylim([0 0.06])
title(['Distribution of t-stat (n = ', num2str(t), ')'])
print('fig2','-depsc')

figure(3)
histogram(DW, 100, 'Normalization','probability')
xlabel('DW$_n$','Interpreter','LaTex')
ylabel('Probability')
title(['Distribution of Durbin-Watson statistics (n = ', num2str(t), ')'])
print('fig3','-depsc')

%% Question 4 (sample size = 500)

% Parameters
t = 500; % sample size
N = 10000; % number of simulations

% Creating the sample of random walk processes
epsilon = randn(t, N);
eta = randn(t, N);
X = cumsum(eta);
Y = cumsum(epsilon);

% Calculating the distribution of the OLS estimator
beta = sum(X.*Y)./sum(X.^2);

% Plotting the distribution of the estimator
figure(4)
histogram(beta, 100, 'Normalization','probability')
xlabel('$\hat{\beta}^{OLS}$','Interpreter','LaTex')
ylabel('Probability')
xlim([-6 6])
ylim([0 0.07])
title(['Distribution of OLS estimator (n = ', num2str(t),')'])
print('fig4','-depsc')

% Calculating distribution of t-statistics and Durbin-Watson statistics
res = Y - beta.*X;
ssr = sum(res.*res);
tstat = beta./sqrt((1/t*ssr)./sum(X.^2));

reslag = res;
reslag(t,:) = [];
resdup = res;
resdup(1,:) = [];

resdif = resdup - reslag;
numer3 = sum(resdif.*resdif);
DW = numer3./ssr;

figure(5)
histogram(tstat, 100, 'Normalization','probability')
xlabel('$t_{\beta = 0}$','Interpreter','LaTex')
ylabel('Probability')
xlim([-200 200])
ylim([0 0.06])
title(['Distribution of t-stat (n = ', num2str(t), ')'])
print('fig5','-depsc')

figure(6)
histogram(DW, 100, 'Normalization','probability')
xlabel('DW$_n$','Interpreter','LaTex')
ylabel('Probability')
title(['Distribution of Durbin-Watson statistics (n = ', num2str(t), ')'])
print('fig6','-depsc')