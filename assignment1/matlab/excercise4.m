    %% ====== Excercise 1.4 ======
% Lolos Ioannis
% AEM: 10674
% ====================

% Requires the Symbolic Math Toolbox

clear;
close all;
clc;

% Initialize functions and interval of interest
syms x;
f1 =  (x - 2)^2 + x * log(x + 3);
df1 = diff(f1);
f2 =  exp(-2 * x) + (x - 2)^2;
df2 = diff(f2);
f3 =  exp(x) * (x^3 - 1) + (x - 1)*sin(x); 
df3 = diff(f3);
start_point = -1;
end_point = 3;

%% Question 1: See how the number of computations varies as l changes

points = 100; % the number of points for the graphs
l = linspace(0.005, 0.2, points);
comps1 = zeros(1, points); % the number of computations for functions f1, f2, f2 respectively
comps2 = zeros(1, points);
comps3 = zeros(1, points);


for i = 1:length(l)
    [comps1(i), ~] = bisectionDer(df1, start_point, end_point, l(i), false);
    [comps2(i), ~] = bisectionDer(df2, start_point, end_point, l(i), false);
    [comps3(i), ~] = bisectionDer(df3, start_point, end_point, l(i), false);
end

% make plots
figure(1)
subplot(1,3,1)
plot(l, comps1, 'LineWidth', 2)
xlabel('\lambda');
ylabel('Computations');
subplot(1,3,2)
plot(l, comps2, 'LineWidth', 2)
xlabel('\lambda');
ylabel('Computations');
subplot(1,3,3)
plot(l, comps3, 'LineWidth', 2)
xlabel('\lambda');
ylabel('Computations');
sgtitle('Number of computations vs \lambda')

%% Question 2: Graph a_k, b_k 
l = 0.01;
figure(2)
bisectionDer(df1, start_point, end_point, l, true);
title('Convergence of f_1')

figure(3)
bisectionDer(df2, start_point, end_point, l, true);
title('Convergence of f_2')

figure(4)
bisectionDer(df3, start_point, end_point, l, true);
title('Convergence of f_3')