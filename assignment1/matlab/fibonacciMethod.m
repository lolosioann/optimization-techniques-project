function [computations, min] = fibonacciMethod(f, a1, b1, e, l, make_plot)

    % Requires the Symbolic Math Toolbox
    
    % Find an approximate n such that F(n) > (b1 -a1) / l, but not by much 
    M = (b1 - a1) / l;
    n = ceil(log(M * sqrt(5)) / log((1 + sqrt(5))/2));
    k = 1;
    computations = 0;
    a = [];
    b = [];
    a(k) = a1;
    b(k) = b1;

    if n < 2
        printf("Smaller l required")
        return
    end

    x1 = a(1) + fibonacci(n - 2) * (b(1) - a(1)) / fibonacci(n);
    x2 = a(1) + fibonacci(n - 1) * (b(1) - a(1)) / fibonacci(n);
    fx1 = f(x1);
    fx2 = f(x2);

    while k < n - 1
        if fx1 > fx2
            a(k+1) = x1;
            b(k+1) = b(k);
            x1 = x2;
            fx1 = fx2;
            x2 = a(k+1) + fibonacci(n - k - 1) * (b(k+1) - a(k+1)) / fibonacci(n - k);
            fx2 = f(x2);
            computations = computations + 1;
        else
            a(k+1) = a(k);
            b(k+1) = x2;
            x2 = x1;
            fx2 = fx1;
            x1 = a(k+1) + fibonacci(n - k - 2) * (b(k+1) - a(k+1)) / fibonacci(n - k);
            fx1 = f(x1);
            computations = computations + 1;
        end
        k = k+1;
    end

    x2 = x1 + e;
    if fx1 > f(x2)
        a(n) = x1;
        b(n) = b(n-1);
    else
        a(n) = a(n-1);
        b(n) = x2;
    end
    k = k+1;
    computations = computations + 1;

    if make_plot
        plot(1:k, a,  1:k, b, "Marker", "o", "MarkerSize", 5, "LineWidth", 2);  
        xlabel('k');
        legend('a_k', 'b_k');
    end

    min = (a(k) + b(k)) / 2;
end