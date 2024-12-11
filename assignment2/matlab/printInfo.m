function printInfo(x1, xk, min, k, g_type, method)
    if isnumeric(g_type) 
        disp('Using constant step size');
    elseif g_type == "minimize"
        disp('Using minimizing step size');
    elseif g_type == "armijo"
        disp('Using armijo step size');
    end
    fprintf("%s with starting point: (%.3f,%.3f) found min: %.3f at point (%.3f,%.3f) after %d iterations\n", method, x1(1), x1(2), min, xk(1), xk(2), k);