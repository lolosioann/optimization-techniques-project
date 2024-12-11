function [min, xk, k] = steepestDescent(f, e, x_1, g, print_info, plt)
    % set the maximum number of iterations and the initial iteration 
    MAX_ITER = 3000;
    MAX_VALUE = 100;
    k = 1;
    % set the initial point
    xk = x_1;
    % create two arrays to store the points for plotting
    pointsX = xk(1);
    pointsY = xk(2);
    % calculate the gradient of the function
    syms x1 x2;
    df = gradient(f, [x1, x2]);
    % calculate the first direction of the gradient
    x1 = xk(1);
    x2 = xk(2);
    dk = double(-subs(df));

    % iterate until the norm of the gradient is less than the precision
    while norm(dk, 2) > e && k <= MAX_ITER
        xk = double(xk + g*dk);
        x1 = xk(1);
        x2 = xk(2);
        pointsX = [pointsX, x1];
        pointsY = [pointsY, x2];
        dk = -subs(df);
        k = k + 1;

        if abs(x1) > MAX_VALUE || abs(x2) > MAX_VALUE
            fprintf("Steepest Descent with step size: %.1f and starting point (%.3f,%.3f) possibly diverges\n", g, x_1(1), x_1(2));
            break;
        end
    end
    min = double(subs(f));

    if print_info
        printInfo(x_1, xk, min, k, g, "Steepest Descent");
    end

    % plot the function and the path of convergence
    if plt
        figure();
        % make 1d plot to show function convergence as k increases
        syms x1 x2;
        plot(1:k, double(subs(f, {x1, x2}, {pointsX, pointsY})), 'r');
        xlabel('k');
        ylabel('f(x)');
        title('Convergence of f(x)');

        % make 2d plot to show the path of convergence
        makePlot(f, df, pointsX, pointsY);
        chr = "Convergence of function " + string(f) + ",with x_1: (" + string(x_1(1)) + ", " + string(x_1(2)) + ")";
        title(chr)
        xlabel('x_1');
        ylabel('x_2');
    end
end