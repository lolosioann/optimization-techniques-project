function g = compute_g(g_type, f, xk, dk)
    if isnumeric(g_type)
        g = g_type;
    elseif g_type == "minimize"
        syms x y g;
        x = xk(1) + g * dk(1);
        y = xk(2) + g * dk(2);
        h = matlabFunction(subs(f));
        options = optimoptions('fminunc', 'Display', 'none');
        g = fminunc(h, 0.1, options);
    elseif g_type == "armijo"
        a = 0.001; b = 0.3; s = 0.1; mk = 0;
        g = 0.1;
        syms x y;

        x = xk(1);
        y = xk(2);
        fk = double(subs(f));

        x = xk(1) + g * dk(1);
        y = xk(2) + g * dk(2);
        disp(dk);
        while fk - double(subs(f)) >= -a*s*b^mk*dot(dk, dk)
            mk = mk + 1;
            g = s * b^mk;
            x = xk(1) + g * dk(1);
            y = xk(2) + g * dk(2);
        end
    else
        disp("Invalid g_type, defaulting to 0.1");
        g = 0.1;
    end
end