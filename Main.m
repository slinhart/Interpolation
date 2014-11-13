%Main Script
clear; close;
xi = [1 1 1 2 2 2 3 3 3];
yi = [1 2 3 1 2 3 1 2 3];
zi = [3.2 4.4 6.5 2.5 4.7 5.8 5.1 3.6 2.9];

x = linspace(min(xi), max(xi));
y = linspace(min(yi), max(yi));
[X, Y] = meshgrid(x, y);

interp = MultiPoly(xi, yi, zi, X, Y);

%Plotting
figure
colormap hsv
surf(X, Y, interp, 'EdgeColor', 'interp'); hold on

%axis([0 3.5 0 3.5 0 10]);
plot3(xi, yi, zi, 'o');  
% xlabel('x')
% ylabel('y')
% zlabel('z')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
xi = [.15 1.95 4 6.7 7.7 9.1 12 14.3 16.5 19];
yi = [0 1.5 3.2 4.7 5.1 6.9 8.9 10 11.1 16];
zi = [0.0225 6.0525 26.24 66.98 85.3 130.42 223.21 304.49 395.46 617];
x = linspace(min(xi), max(xi));
y = linspace(min(yi), max(yi));
[X, Y] = meshgrid(x, y);

interp = MultiPoly(xi, yi, zi, X, Y);

%Plotting
figure
colormap hsv
surf(X, Y, interp, 'EdgeColor', 'interp'); hold on

%axis([0 3.5 0 3.5 0 10]);
plot3(xi, yi, zi, 'o');  