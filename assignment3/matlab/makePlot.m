function makePlot(f, df, pointsX, pointsY)
    % f: function
    % df: gradient of f
    % pointsX: x coordinates of points
    % pointsY: y coordinates of points
[X1, X2] = meshgrid(-12:0.3:12, -12:0.3:12);
    syms x1 x2;
    F = double(subs(f, {x1, x2}, {X1, X2}));
    % dfx = double(subs(df(1), {x1, x2}, {X1, X2})); % ∂f/∂x
    % dfy = double(subs(df(2), {x1, x2}, {X1, X2})); % ∂f/∂y
    figure;
    contourf(X1, X2, F, 20, 'LineColor', 'k');
    hold on;
    % quiver(X1, X2, dfx, dfy, 'g');
    plot(pointsX, pointsY, 'r');