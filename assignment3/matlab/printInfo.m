function printInfo(x1, xk, min, k, g, method) 
    fprintf('Using step size: %.1f\n', g);
    fprintf("%s with starting point: (%.3f,%.3f) found min: %.3f at point (%.3f,%.3f) after %d iterations\n", method, x1(1), x1(2), min, xk(1), xk(2), k);