clear;
close all;
clc;

symvar x;
f1 = @(x) (x - 2).^2 + x .* log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2).^2;
f3 = @(x) exp(x) .* (x.^3 - 1) + (x - 1).*sin(x); 
start_point = -1;
end_point = 3;

x = linspace(start_point, end_point, 1000);

figure(1)
plot(x, f1(x), x, f2(x), x, f3(x), 'LineWidth', 2);
ylim([-3 18]);
xlabel('x');
ylabel('f(x)');
legend('f_1', 'f_2', 'f_3');
title('Functions f_1, f_2, f_3');

l = 0.01;
e = 0.001;

figure(2)
plot(x, f1(x), x, f2(x), x, f3(x), 'LineWidth', 2);
ylim([-3 18]);
xlabel('x');
ylabel('f(x)');
hold on;
[~, min1] = bisection(f1, start_point, end_point, e, l, false);
[~, min2] = bisection(f2, start_point, end_point, e, l, false);
[~, min3] = bisection(f3, start_point, end_point, e, l, false);
plot(min1, f1(min1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(min2, f2(min2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(min3, f3(min3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'y');
hold off;
legend('f_1', 'f_2', 'f_3');
title("Minima found by bisection method");

figure(3)
plot(x, f1(x), x, f2(x), x, f3(x), 'LineWidth', 2);
ylim([-3 18]);
xlabel('x');
ylabel('f(x)');
hold on;
[~, min1] = goldenSection(f1, start_point, end_point, l, false);
[~, min2] = goldenSection(f2, start_point, end_point, l, false);
[~, min3] = goldenSection(f3, start_point, end_point, l, false);
plot(min1, f1(min1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(min2, f2(min2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(min3, f3(min3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'y');
hold off;
legend('f_1', 'f_2', 'f_3');
title("Minima found by golden section method");

figure(4)
plot(x, f1(x), x, f2(x), x, f3(x), 'LineWidth', 2);
ylim([-3 18]);
xlabel('x');
ylabel('f(x)');
hold on;
[~, min1] = fibonacciMethod(f1, start_point, end_point, e, l, false);
[~, min2] = fibonacciMethod(f2, start_point, end_point, e, l, false);
[~, min3] = fibonacciMethod(f3, start_point, end_point, e, l, false);
plot(min1, f1(min1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(min2, f2(min2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(min3, f3(min3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'y');
hold off;
legend('f_1', 'f_2', 'f_3');
title("Minima found by Fibonacci method");

figure(5)

k = x;
plot(k, f1(k), k, f2(k), k, f3(k), 'LineWidth', 2);
ylim([-3 18]);
xlabel('x');   
ylabel('f(x)');
hold on;

syms x;
f1 =  (x - 2)^2 + x * log(x + 3);
df1 = diff(f1);
f2 =  exp(-2 * x) + (x - 2)^2;
df2 = diff(f2);
f3 =  exp(x) * (x^3 - 1) + (x - 1)*sin(x); 
df3 = diff(f3);

[~, min1] = bisectionDer(df1, start_point, end_point, l, false);
[~, min2] = bisectionDer(df2, start_point, end_point, l, false);
[~, min3] = bisectionDer(df3, start_point, end_point, l, false);
plot(min1, subs(f1, x, min1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(min2, subs(f2, x, min2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(min3, subs(f3, x, min3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'y');
hold off;
legend('f_1', 'f_2', 'f_3');
title("Minima found by bisection method with derivatives");