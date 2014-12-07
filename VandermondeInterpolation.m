clear all; close all;
% %%%%% z = x^2 + y^2
%     %%% 9 Naively chosen points
%     xi = [-7, 4, 8, 1.5, 3, -9, -6.5, 0.5, 0];
%     yi = [2, -2, 5.5, -3, 10, 9, 7.7, -1, -9.9];
%     f = @(x,y) (x.^2 + y.^2);
%     name = 'Naive: x^2 + y^2';
%     ExecuteInterpolation(xi, yi, f, name);
%     %%%
%         
%     %%% 9 Grid pattern points between (-10,10)
%     xi = [-10, -10, -10, 0, 0, 0, 10, 10, 10];
%     yi = [-10, 0, 10, -10, 0, 10, -10, 0, 10];
%     f = @(x,y) (x.^2 + y.^2);
%     name = '9 grid points: x^2 + y^2';
%     ExecuteInterpolation(xi, yi, f, name);
%     %%%
%     
%     %%% 15 grid pattern points between (-10,10)
%     xi = [-10, -10, -10, -5, -5, -5, 0, 0, 0, 5, 5, 5, 10, 10 ,10];
%     yi = [10, 0, -10, 10, 0, -10, 10, 0, -10, 10, 0, -10, 10, 0, -10];
%     f = @(x,y) (x.^2 + y.^2);
%     name = '15 grid points: x^2 + y^2';
%     ExecuteInterpolation(xi, yi, f, name);
%     %%%
% 
% %%%%%

%%%%%% z = sin(1 + sqrt(x^2 + y^2))
    f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
    
    %%% 9 naively points chosen between (-4,4)
    xi = [-3.8, -3.65, -2.7, -2.147, -0.5, 1.4, 2.1, 3.1, 3.95];
    yi = [1, -3.85, 2.47, 0.1, -1.5, 2.05, 1.337, 3.6, -2.3];
    name = '9 naive points (-4,4): sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%

    %%% 9 grid points chosen between (-4,4)
    xi = [-4, -4, -4, 0, 0, 0, 4, 4, 4];
    yi = [4, 0, -4, 4, 0, -4, 4, 0, -4];
    name = '9 grid points (-4,4): sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 9 grid points chosen between (-10,10)
    xi = [-10, -10, -10, 0, 0, 0, 10, 10, 10];
    yi = [-10, 0, 10, -10, 0, 10, -10, 0, 10];
    name = '9 grid points (-10,10): sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 15 strategic points chosen between(-10,10)
    xi = [-9, -9.88, -9.11, -7, -6, -4.33, -2.8, 0, 0, 2.7, 2.8, 3.59, 5.22, 6.5, 9.66];
    yi = [9.55, 0.11, -4, 7, -7.8, -5, 2.22, 7, 0, 3, -6.41, -0.2, 4.68, 8, -9.33];
    name = '15 strategic points: sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
%%%%%

% %%%%% z = (x*y*(x^2 - y^2))/(x^2 + y^2)
% 
%     %%% 9 strategically chosen points
%     xi = [-3.99, -3.89, -3.911, -0.1, 0.13, 0.03, 2.22, 2.34, 3.90];
%     yi = [3.93, 0.11, -3.87, 3.01, 0.12, -2.99, 2.05, -2.11, -0.13];
%     x = linspace(min(xi), max(xi));
%     y = linspace(min(yi), max(yi));
%     f = @(x,y) (x .* y .* (x.^2 - y.^2)) ./ (x.^2 + y.^2);
%     zi = f(xi,yi); 
%     [X, Y] = meshgrid(x, y);
%     interp = Interpolate(xi, yi, zi, X, Y);
%     [realZ, maxError, avgError] = FindError(f, X, Y, interp);
%     name = '9 points: (xy(x^2 - y^2))/(x^2 + y^2)';
%     Plot3D(X, Y, xi, yi, zi, interp, name, realZ, maxError, avgError);
%     %%%
% 
%     %%% 13 strategically chosen points
%     xi = [-3.99, -3.89, -3.911, -2.1, -2.03, -0.1, 0.13, 0.03, 2.22, 2.34, 3.97, 3.90, 3.88];
%     yi = [3.93, 0.11, -3.87, 1.99, -1.95, 3.01, 0.12, -2.99, 2.05, -2.11, 3.79, -0.13, -3.967];
%     x = linspace(min(xi), max(xi));
%     y = linspace(min(yi), max(yi));
%     f = @(x,y) (x .* y .* (x.^2 - y.^2)) ./ (x.^2 + y.^2);
%     zi = f(xi,yi); 
%     [X, Y] = meshgrid(x, y);
%     interp = Interpolate(xi, yi, zi, X, Y);
%     [realZ, maxError, avgError] = FindError(f, X, Y, interp);
%     name = '13 points: (xy(x^2 - y^2))/(x^2 + y^2)';
%     Plot3D(X, Y, xi, yi, zi, interp, name, realZ, maxError, avgError);
%     %%%
% %%%%%
% 
% 
% 
% 
% 
% 
