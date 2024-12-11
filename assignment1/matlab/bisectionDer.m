function [computations, min] = bisectionDer(df, a1, b1, l, make_plot) 
    n = ceil(log((b1 - a1) / l) / log(2)); % Find n such that (1/2)^n <= l / (b1 -a1)
    syms x;
    k = 1;
    computations = 0;
    a = [];
    b = [];
    a(k) = a1;
    b(k) = b1;

    while 1
        xk = (a(k) + b(k)) / 2;
        der = double(subs(df, x, xk));
        computations = computations + 1;

        if der == 0
            break
        elseif der > 0
            a(k+1) = a(k);
            b(k+1) = xk;
        else
            a(k+1) = xk;
            b(k+1) = b(k);
        end

        if k == n
            break
        end

        k = k+1;
    end

    if make_plot
        plot(1:(k+1), a,  1:(k+1), b, "Marker", "o", "MarkerSize", 5, "LineWidth", 2);  
        xlabel('k');
        legend('a_k', 'b_k');
    end

    min = (a(k+1) + b(k+1)) / 2;
end