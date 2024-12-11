function [min_val, xk, k] = levMarq(f, e, x1, g_type, print_info, plt)
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

    while norm(grad, 2) > e && k <= MAX_ITER
        % compute the hessian s.t. we have positive definite matrix
        hess = subs(hf);
        while min(eig(hess)) <= 0
            hess = hess + eye(size(hess)) * 0.01;
        end
        dk = -hess \ grad;
        xk = double(xk + compute_g(g_type, f, xk, dk) * dk);
        x = xk(1);
        y = xk(2);
        pointsX = [pointsX, x];
        pointsY = [pointsY, y];
        grad = subs(df);
        k = k + 1;
    end
    min_val = double(subs(f));

    if print_info
        printInfo(x1, xk, min_val, k, g_type, "Levenberg-Marquardt");
    end

    if plt
        makePlot(f, df, pointsX, pointsY);
    end