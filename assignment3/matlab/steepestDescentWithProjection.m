function [min, xk, k] = steepestDescentWithProjection(f, e, x_1, g, s, l, u, print_info, plt)
    % set the maximum number of iterations and the initial iteration 
    MAX_ITER = 1000;
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
    while norm(dk, 2) > e  
        xk = double(xk + g*(projection(xk, dk, l, u, s) - xk));
        x1 = xk(1);
        x2 = xk(2);
        pointsX = [pointsX, x1];
        pointsY = [pointsY, x2];
        dk = -subs(df);
        k = k + 1;

        if abs(x1) > MAX_VALUE || abs(x2) > MAX_VALUE
            fprintf("Steepest Descent (Projection) with step size: %.1f and starting point (%.3f,%.3f) possibly diverges\n", g, x_1(1), x_1(2));
            break;
        end

        if k > MAX_ITER
            fprintf("Steepest Descent (Projection) with step size: %.1f and starting point (%.3f,%.3f) could not converge\n", g, x_1(1), x_1(2));
            fprintf("MAXIMUM ITERATIONS REACHED\n");
            break;
        end
    end
    min = double(subs(f));

    if print_info
        printInfo(x_1, xk, min, k, g, "Steepest Descent with Projection");
    end

    % plot the function and the path of convergence
    if plt
        % make 1d plot to show function convergence as k increases
        syms x1 x2;
        plot(1:k, log(double(subs(f, {x1, x2}, {pointsX, pointsY}))), 'r');
        xlabel('k');
        ylabel('log(f(x))');
        title('Convergence of f(x)');

        % make 2d plot to show the path of convergence
        makePlot(f, df, pointsX, pointsY);
        chr = "Convergence of function " + string(f) + ",with x_1: (" + string(x_1(1)) + ", " + string(x_1(2)) + ")";
        title(chr)
        xlabel('x_1');
        ylabel('x_2');
        % plot the constraints
        hold on;
        plot([l(1), l(1), u(1), u(1), l(1)], [l(2), u(2), u(2), l(2), l(2)], 'b--', 'LineWidth', 1.5);
    end
end

function proj = projection(x, dfk, l, u, s)
    proj = x + s*dfk;

    if proj(1) < l(1)
        proj(1) = l(1);
    end
    if proj(1) > u(1)
        proj(1) = u(1);
    end

    if proj(2) < l(2)
        proj(2) = l(2);
    end
    if proj(2) > u(2)
        proj(2) = u(2);
    end

end