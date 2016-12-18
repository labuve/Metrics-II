%% Econometrics II, Problem Set I, Question 4
% Nurfatima Jandarova
clear all

% Loading data
data=xlsread('PS1SPYdata.xlsx');
h = 20; % lag length

%% Computing autocorrelations
corr = autocorr(data(:,7), h); % Autocorrelation of raw returns
corabs = autocorr(abs(data(:,7)),h); % Autocorrelation of absolute returns
corsq = autocorr((data(:,7)).^2,h); % Autocorrelation of squared returns

%% Plotting figures
figure(1)
autocorr(data(:,7), h)
title('Autocorrelation of raw returns')

figure(2)
autocorr(abs(data(:,7)),h)
title('Autocorrelation of absolute returns')

figure(3)
autocorr((data(:,7)).^2,h)
title('Autocorrelation of squared returns')

figure(4)
plot(1:3524,data(:,7))
xlabel('Time')
ylabel('Raw returns')
title('Plot of raw returns')

%%
% So, from the last chart we see that raw returns are unlikely to be
% stationary as variance of the series changes with time (and similarly,
% absolute returns and squared returns). From the ACF plots, we can see
% that autocorrelations are significantly different from zero and don't
% decay as lag length increases. Hence, the series is not iid and not
% ergodic.