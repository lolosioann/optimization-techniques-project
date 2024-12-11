%% ====== Excercise 1.1 ======
% Lolos Ioannis
% AEM: 10674
% ====================

clear;
close all;
clc;

% Initialize functions and interval of interest
symvar x;
f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1)*sin(x); 
start_point = -1;
end_point = 3;


%% Question 1: See how the number of computations varies as e changes
l = 0.01;
points = 1000; % the number of points for the graphs
e = linspace(1e-10, 4e-3, points);
comps1 = zeros(1, points); % the number of computations for functions f1, f2, f2 respectively
comps2 = zeros(1, points);
comps3 = zeros(1, points);


for i = 1:length(e)
    [c, ~] = bisection(f1, start_point, end_point, e(i), l, false);
    comps1(i) = c;
    [c, ~] = bisection(f1, start_point, end_point, e(i), l, false);
    comps2(i) = c;
    [c, ~] = bisection(f1, start_point, end_point, e(i), l, false);
    comps3(i) = c;
end

% make plots
figure(1)
subplot(1,3,1)
plot(e, comps1, "LineWidth", 2)
xlabel('\epsilon');
ylabel('Computations');
legend('f_1', 'Location', 'northwest');
ylim([17.5, 22.5]);
subplot(1,3,2)
plot(e, comps2, 'LineWidth', 2)
xlabel('\epsilon');
ylabel('Computations');
legend('f_2', 'Location', 'northwest');
ylim([17.5, 22.5]);
subplot(1,3,3)
plot(e, comps3, 'LineWidth', 2)
xlabel('\epsilon');
ylabel('Computations');
legend('f_3', 'Location', 'northwest');
ylim([17.5, 22.5]);
sgtitle('Number of computations as \epsilon changes')


%% Question 2: See how the number of computations varies as l changes
e = 0.001;
points = 100; % the number of points for the graphs
l = linspace(0.01, 0.2, points);
comps1 = zeros(1, points); % the number of computations for functions f1, f2, f2 respectively
comps2 = zeros(1, points);
comps3 = zeros(1, points);


for i = 1:length(l)
    [c, ~] = bisection(f1, start_point, end_point, e, l(i), false);
    comps1(i) = c;
    [c, ~] = bisection(f2, start_point, end_point, e, l(i), false);
    comps2(i) = c;
    [c, ~] = bisection(f3, start_point, end_point, e, l(i), false);
    comps3(i) = c;
end

% make plots
figure(2)
subplot(1,3,1)
plot(l, comps1, 'LineWidth', 2)
ylim([9.5, 18.5]);
xlabel('\lambda');
ylabel('Computations');
legend('f_1', 'Location', 'northeast');
subplot(1,3,2)
plot(l, comps2, 'LineWidth', 2)
ylim([9.5, 18.5]);
xlabel('\lambda');
ylabel('Computations');
legend('f_2', 'Location', 'northeast');
subplot(1,3,3)
plot(l, comps3, 'LineWidth', 2)
ylim([9.5, 18.5]);
xlabel('\lambda');
ylabel('Computations');
legend('f_3', 'Location', 'northeast');
sgtitle('Number of computations as \lambda changes')


%% Question 3: Graph a_k, b_k
e = 0.001;
l = 0.01;
figure(3)
bisection(f1, start_point, end_point, e, l, true);
ylim([-1.5, 3.5]);
title('Convergence of f_1')

figure(4)
bisection(f2, start_point, end_point, e, l, true);
ylim([-1.5, 3.5]);
title('Convergence of f_2')

figure(5)
bisection(f3, start_point, end_point, e, l, true);
ylim([-1.5, 3.5]);
title('Convergence of f_3')