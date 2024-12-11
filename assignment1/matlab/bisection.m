function [computations, min] = bisection(f, a1, b1, e, l, make_plot)
    alphas = [];
    betas = [];
    computations = 0;
    k = 1;
    alphas(k) = a1;
    betas(k) = b1;

    while 1
        a = alphas(k);
        b = betas(k);

        if abs(a - b) <= l
            break;
        end
        
        x1 = (a+b)/2 - e;
        x2 = (a+b)/2 + e;

        if f(x1) < f(x2)
            alphas(k+1) = a;
            betas(k+1) = x2;
        else
            alphas(k+1) = x1;
            betas(k+1) = b;
        end
        computations = computations + 2;
        k = k+1;
    end

    if make_plot
        plot(1:k, alphas,  1:k, betas, "Marker", "o", "MarkerSize", 5, "LineWidth", 2);  
        xlabel('k');
        legend('a_k', 'b_k');
    end

    min = (alphas(k) + betas(k)) / 2;
end