%% ====== Excercise 3 ======
% Lolos Ioannis
% AEM: 10674
% ==========================

clear;
clc;
close all;

%% the function
syms x1 x2;
f = (1/3)*x1^2 + 3*x2^2;
df = gradient(f, [x1, x2]);

%% plot f

figure(1);
fsurf(f, [-12, 12, -12, 12]);
xlabel('x1');
ylabel('x2');
zlabel('f(x)');
title('3D plot of f(x) = (1/3)x_1^2 + 3x_2^2');

%% plot gradient
[X1, X2] = meshgrid(-2:0.2:2, -2:0.2:2);
dfx = double(subs(df(1), {x1, x2}, {X1, X2})); % ∂f/∂x
dfy = double(subs(df(2), {x1, x2}, {X1, X2})); % ∂f/∂y

figure(2);
F = double(subs(f, {x1, x2}, {X1, X2}));
contourf(X1, X2, F, 20, 'LineColor', 'k');
hold on;
quiver(X1, X2, dfx, dfy, 'r');
xlabel('x1');
ylabel('x2');
title('Plot of Df(x)');
hold off;

%% Excercise 3.1
e = 0.001;
steps = [0.1 0.3 3 5];
starting_point = [-4; 7];

for i = 1:length(steps)
    steepestDescent(f, e, starting_point, steps(i), true, true);
    fprintf('\n'); % print a newline
end

%% Excercise 3.2
% constraints:
l = [-10; -8];
u = [5; 12];

e = 0.01;
s = 5;
g = 0.5;
starting_point = [5; -5];

steepestDescentWithProjection(f, e, starting_point, g, s, l, u, false, true);
fprintf('\n'); % print a newline

%% Excercise 3.3
% constraints:
l = [-10; -8];
u = [5; 12];

e = 0.01;
s = 15;
g = 0.1;
starting_point = [-5; 10];

steepestDescentWithProjection(f, e, starting_point, g, s, l, u, true, true);
fprintf('\n'); % print a newline

%% Excercise 3.4
% constraints:
l = [-10; -8];
u = [5; 12];

e = 0.01;
s = 0.1;
g = 0.2;

% starting point (8, -10) is outside the region bound by the constraints,
% so we need to project it to the feasible region
starting_point = [5; -8];

steepestDescentWithProjection(f, e, starting_point, g, s, l, u, true, true);