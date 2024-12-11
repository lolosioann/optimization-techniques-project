%% ====== Excercise 2 ======
% Lolos Ioannis
% AEM: 10674
% ====================

clear;
clc;
close all;


%% function arguments
syms x y;
f = x^5 * exp(- x^2 - y^2);
df = gradient(f, [x, y]);
step = 0.3;
e = 0.01;

%% plot f

% figure(1);
% fsurf(f, [-3, 3, -3, 3]);
% xlabel('x');
% ylabel('y');
% zlabel('f(x, y)');
% title('3D plot of f(x, y) = x^5 * exp(-x^2 - y^2)');

%% plot gradient
% [X, Y] = meshgrid(-3:0.2:3, -3:0.3:3);
% dfx = double(subs(df(1), {x, y}, {X, Y})); % ∂f/∂x
% dfy = double(subs(df(2), {x, y}, {X, Y})); % ∂f/∂y

% figure(2);
% F = double(subs(f, {x, y}, {X, Y}));
% contourf(X, Y, F, 20, 'LineColor', 'k');
% hold on;
% quiver(X, Y, dfx, dfy, 'r');
% xlabel('x');
% ylabel('y');
% title('Plot of Df(x, y)');
% hold off;

%% steepestDescent
% starting point: (0,0)
% steepestDescent(f, e, [0;0], 0.1, true, true);
% fprintf("\n");
% steepestDescent(f, e, [0;0], "minimize", true, true);
% fprintf("\n");
% steepestDescent(f, e, [0; 0], "armijo", true, true);
% fprintf("\n");

% starting point: (-1,1)
steepestDescent(f, e, [-1; 1], step, true, true);
title('Steepest Descent with constant step size');
fprintf("\n");
steepestDescent(f, e, [-1; 1], "minimize", true, true);
title('Steepest Descent with minimizing step size');
fprintf("\n");
% steepestDescent(f, e, [-1; 1], "armijo", true, true);
% title('Steepest Descent with Armijo step size');
% fprintf("\n");

% starting point: (1,-1)
steepestDescent(f, e, [1; -1], step, true, true);
title('Steepest Descent with constant step size');
fprintf("\n");
steepestDescent(f, e, [1; -1], "minimize" ,true, true);
title('Steepest Descent with minimizing step size');
fprintf("\n");
% steepestDescent(f, e, [1; -1], "armijo", true, true);
% title('Steepest Descent with Armijo step size');
% fprintf("\n");

%% Newton
% starting point: (0,0)
% newton(f, e, [0;0], 0.1, true, false);
% title('Newton with constant step size');
% fprintf("\n");
% newton(f, e, [0;0], "minimize", true, false);
% title('Newton with minimizing step size');
% fprintf("\n");

% starting point: (-1,1)
% newton(f, e, [-1; 1], 0.1, true, true);
% title('Newton with constant step size');
% fprintf("\n");
% newton(f, e, [-1; 1], "minimize", true, true);
% title('Newton with minimizing step size');
% fprintf("\n");

% starting point: (1,-1)
% newton(f, e, [1; -1], 0.1, true, false);
% fprintf("\n");
% newton(f, e, [1; -1], "minimize", true, false);
% fprintf("\n");

%% Levenberg - Marquardt
% starting point: (0,0)
% levMarq(f, e, [0;0], 0.1, true, false);
% fprintf("\n");
% levMarq(f, e, [0;0], "minimize", true, false);
% fprintf("\n");
% starting point: (-1,1)
% levMarq(f, e, [-1; 1], 0.1, true, true);
% fprintf("\n");
% levMarq(f, e, [-1; 1], "minimize", true, false);
% fprintf("\n");
% starting point: (1,-1)
% levMarq(f, e, [1; -1], 0.1, true, false);
% fprintf("\n");
% levMarq(f, e, [1; -1], "minimize", true, false);
% fprintf("\n");