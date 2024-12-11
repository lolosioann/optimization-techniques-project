function [computations, min] = goldenSection(f, a1, b1, l, make_plot)
    gamma = 0.618;
    a = [];
    b = [];
    computations = 0;
    k = 1;
    a(k) = a1;
    b(k) = b1;

    x1 = a(k) + (1 - gamma)*(b(k) - a(k));
    x2 = a(k) + gamma*(b(k) - a(k));
    fx1 = f(x1);
    fx2 = f(x2);
    computations = computations + 2;
    while abs(a(k) - b(k)) > l
        if fx1 > fx2
            a(k+1) = x1;
            b(k+1) = b(k);
            x1 = x2;
            fx1 = fx2;
            x2 = a(k+1) + gamma * (b(k+1) - a(k+1));
            fx2 = f(x2);
        else
            a(k+1) = a(k);
            b(k+1) = x2;
            x2 = x1;
            fx2 = fx1;
            x1 = a(k+1) + (1 - gamma)*(b(k+1) - a(k+1));
            fx1 = f(x1);
        end
        computations = computations + 1;
        k = k+1;
    end

    if make_plot
        plot(1:k, a,  1:k, b, "Marker", "o", "MarkerSize", 5, "LineWidth", 2);  
        xlabel('k');
        legend('a_k', 'b_k');
    end

    min = (a(k) + b(k))/2;
end