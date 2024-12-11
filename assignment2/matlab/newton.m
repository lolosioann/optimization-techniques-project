function [min, xk, k] = newton(f, e, x1, g_type, print_info, plt)
    % set the maximum number of iterations and the initial iteration 
    MAX_ITER = 3000;
    k = 1;
    % set the initial point
    xk = x1;
    % create two arrays to store the points for plotting
    pointsX = xk(1);
    pointsY = xk(2);
    % calculate the gradient and hessian of the function
    syms x y;
    df = gradient(f, [x, y]);
    hf = hessian(f, [x, y]);
    % calculate the first direction of the gradient
    x = xk(1);
    y = xk(2);
    grad = subs(df);

    % iterate until the norm of the gradient is less than the precision
    while norm(grad, 2) > e && k <= MAX_ITER
        dk = -subs(hf) \ grad;
        xk = double(xk + compute_g(g_type, f, xk, dk) * dk);
        x = xk(1);
        y = xk(2);
        pointsX = [pointsX, x];
        pointsY = [pointsY, y];
        grad = subs(df);
        k = k + 1;
    end
    min = double(subs(f));

    if print_info
        printInfo(x1, xk, min, k, g_type, "Newton");
    end

    % plot the function and the path of convergence
    if plt
        makePlot(f, df, pointsX, pointsY);
    end