clear; close;
xi = [.15 1.95 4 6.7 7.7 9.1 12 14.3 16.5 19];
yi = [0 1.5 3.2 4.7 5.1 6.9 8.9 10 11.1 16];
f = @(x,y) (x.^2 + y.^2);
zi = f(xi, yi);
x = linspace(min(xi), max(xi));
y = linspace(min(yi), max(yi));
[X, Y] = meshgrid(x, y);

interp = Interpolate(xi, yi, zi, X, Y);
Plot3D(X, Y, xi, yi, zi, interp);