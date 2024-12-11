function makePlot(f, df, pointsX, pointsY)
        % f: function
        % df: gradient of f
        % pointsX: x coordinates of points
        % pointsY: y coordinates of points
    [X, Y] = meshgrid(-3:0.2:3, -3:0.3:3);
        syms x y;
        F = double(subs(f, {x, y}, {X, Y}));
        dfx = double(subs(df(1), {x, y}, {X, Y})); % ∂f/∂x
        dfy = double(subs(df(2), {x, y}, {X, Y})); % ∂f/∂y
        figure;
        contourf(X, Y, F, 20, 'LineColor', 'k');
        hold on;
        quiver(X, Y, dfx, dfy, 'g');
        plot(pointsX, pointsY, 'r');