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

    %%% 9 Naively chosen points between (-4,4)
    xi = [-3.8, -3.65, -2.7, -2.147, -0.5, 1.4, 2.1, 3.1, 3.95];
    yi = [1, -3.85, 2.47, 0.1, -1.5, 2.05, 1.337, 3.6, -2.3];
    f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
    name = 'Naive: sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%

    %%% 9 Points strategially chosen between (-4,4)
    xi = [-3.8, -1.2, -1.9, -3.2, 0.1, 1.22, 1.25, 3.83, 3.6];
    yi = [-3.85, -1.95, 2.1, 3.91, 0.33, 1.77, -1.8, 3.7, -3.66];
    f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
    name = 'Strategic: sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 9 grid points (-10,10)
    xi = [-10, -10, -10, 0, 0, 0, 10, 10, 10];
    yi = [-10, 0, 10, -10, 0, 10, -10, 0, 10];
    f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
    name = 'N: sin(1 + sqrt(x^2 + y^2))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
%     %%% 10 strategic points (-10,10)
%     xi = [];
%     yi = [];
%     f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
%     name = 'N: sin(1 + sqrt(x^2 + y^2))';
%     ExecuteInterpolation(xi, yi, f, name);
%     %%%
%     
%     %%% 15 strategic points (-4,4)
%     xi = [];
%     yi = [];
%     f = @(x,y) sin(1 + sqrt(x.^2 + y.^2));
%     name = 'N: sin(1 + sqrt(x^2 + y^2))';
%     ExecuteInterpolation(xi, yi, f, name);
%     %%%
    
%%%%%

%%%%% z = (x*y*(x^2 - y^2))/(x^2 + y^2)
    f = @(x,y) (x .* y .* (x.^2 - y.^2)) ./ (x.^2 + y.^2 + eps);
    
    %%% 9 Naively chosen points between (-4, 4)
    xi = [3, 1.7, -1, 0.3, -3.3, -2, -2.5, -1.8, 2.2];
    yi = [-0.1, 1, 3.2, -2.8, 1.2, -0.9, 2, 0.8, 2];
    name = 'Naive 9: (xy(x^2 - y^2))/(x^2 + y^2)';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 9 Grid points between (-4, 4)
    xi = [-4, -4, -4, 0, 0, 0, 4, 4, 4];
    yi = [4, 0, -4, 4, 0, -4, 4, 0, -4];
    name = 'Grid 9: (xy(x^2 - y^2))/(x^2 + y^2)';
    ExecuteInterpolation(xi, yi, f, name);
    %%%

    %%% 9 strategically chosen points
    xi = [-3.99, -3.89, -3.911, -0.1, 0.13, 0.03, 2.22, 2.34, 3.90];
    yi = [3.93, 0.11, -3.87, 3.01, 0.12, -2.99, 2.05, -2.11, -0.13];
    name = 'Strategic 9: (xy(x^2 - y^2))/(x^2 + y^2)';
    ExecuteInterpolation(xi, yi, f, name);
    %%%

    %%% 13 strategically chosen points
    xi = [-3.99, -3.89, -3.911, -2.1, -2.03, -0.1, 0.13, 0.03, 2.22, 2.34, 3.97, 3.90, 3.88];
    yi = [3.93, 0.11, -3.87, 1.99, -1.95, 3.01, 0.12, -2.99, 2.05, -2.11, 3.79, -0.13, -3.967];
    name = 'Strategic 13: (xy(x^2 - y^2))/(x^2 + y^2)';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
%%%%%

%%%%% z = y * e^(sqr(x))
    f = @(x,y) (y .* exp(sqrt(x)));
    
    %%% 9 Naively chosen points (0, 10)
    xi = [3, 7, 2, 1, 4.2, 4.8, 1.7, 6, 9.7];
    yi = [3.1, 6, 1, 4.1, 9, 8.2, 1.1, 0.2, 7.2];
    name = 'Naive 9: y(e\^(sqrt(x))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 9 Grid points (0, 10)
    xi = [0, 5, 10, 0, 5, 10, 0, 5, 10];
    yi = [0, 0, 0, 5, 5, 5, 10, 10, 10];
    name = 'Grid 9: y(e\^sqrt(x)';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 9 Strategically chosen points (0, 10)
    xi = [10, 0, 0, 1, 4.2, 10, 1.7, 6, 9.7];
    yi = [10, 0, 10, 4.1, 9, 0.01, 1.1, 4, 7.2];
    name = 'Strategic 9: y(e\^sqrt(x))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 10 Strategically chosen points (0, 10)
    xi = [10, 0, 0, 1, 4.2, 10, 1.7, 6, 9.7, 7.8];
    yi = [10, 0, 10, 4.1, 9, 0.01, 1.1, 4, 7.2, 7.8];
    name = 'Strategic 10: y(e\^sqrt(x))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 15 Strategically chosen points (0, 10)
    xi = [10, 0, 0, 1, 4.2, 10, 1.7, 6, 9.7, 7.8, 4.2, 9, 2.3, 7.8, 3.1];
    yi = [10, 0, 10, 4.1, 9, 0.01, 1.1, 4, 7.2, 7.8, 6, 4.5, 8, 1.5, 3.3];
    name = 'Strategic 15: y(e\^sqrt(x))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
    %%% 17 Strategically chosen points (0, 10)
    xi = [10, 0, 0, 1, 4.2, 10, 1.7, 6, 9.7, 7.8, 4.2, 9, 2.3, 7.8, 3.1, 5, 7.9];
    yi = [10, 0, 10, 4.1, 9, 0.01, 1.1, 4, 7.2, 7.8, 6, 4.5, 8, 1.5, 3.3, 2, 7.1];
    name = 'Strategic 17: y(e\^sqrt(x))';
    ExecuteInterpolation(xi, yi, f, name);
    %%%
    
%%%%%
