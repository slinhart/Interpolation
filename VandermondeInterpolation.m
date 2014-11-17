clear; close;

%%% z = x^2 + y^2
xi = [.15 1.95 4 6.7 7.7 9.1 12 14.3 16.5 19];
yi = [0 1.5 3.2 4.7 5.1 6.9 8.9 10 11.1 16];
f = @(x,y) (x.^2 + y.^2);
zi = f(xi, yi);
x = linspace(min(xi), max(xi));
y = linspace(min(yi), max(yi));
[X, Y] = meshgrid(x, y);
interp = Interpolate(xi, yi, zi, X, Y);
Plot3D(X, Y, xi, yi, zi, interp);
%%%

%%%%%% z = sin(1 + sqrt(x^2 + y^2))
%%% Naively chosen points between (-4,4)
xi = [-3.8, -3.65, -2.7, -2.147, -0.5, 1.4, 2.1, 3.1, 3.95];
yi = [1, -3.85, 2.47, 0.1, -1.5, 2.05, 1.337, 3.6, -2.3];
x = linspace(min(xi), max(xi));
y = linspace(min(yi), max(yi));
f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
zi = f(xi,yi); 
[X, Y] = meshgrid(x, y);
interp = Interpolate(xi, yi, zi, X, Y);
Plot3D(X, Y, xi, yi, zi, interp);
%%%

%%% Points strategially chosen between (-4,4)
xi = [-3.8, -1.2, -1.9, -3.2, 0.1, 1.22, 1.25, 3.83, 3.6];
yi = [-3.85, -1.95, 2.1, 3.91, 0.33, 1.77, -1.8, 3.7, -3.66];
x = linspace(min(xi), max(xi));
y = linspace(min(yi), max(yi));
f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
zi = f(xi,yi); 
[X, Y] = meshgrid(x, y);
interp = Interpolate(xi, yi, zi, X, Y);
Plot3D(X, Y, xi, yi, zi, interp);
%%%