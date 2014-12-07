function ExecuteInterpolation(xi, yi, f, name)
    x = linspace(min(xi), max(xi));
    y = linspace(min(yi), max(yi));
    zi = f(xi,yi);
    [X, Y] = meshgrid(x, y);
    interp = Interpolate(xi, yi, zi, X, Y);
    [realZ, maxError, avgError] = FindError(f, X, Y, interp);
    Plot3D(X, Y, xi, yi, zi, interp, name, realZ, maxError, avgError);
end