function Plot3D(xplane, yplane, xi, yi, zi, interp, name, realZ, maxError, avgError)
% Plot interpolated function
figure
colormap autumn
surf(xplane, yplane, interp, 'EdgeColor', 'interp'); hold on

% Plot real function
if (~isnan(realZ))
   freezeColors
   colormap winter
   surf(xplane, yplane, realZ, 'EdgeColor', 'interp');
end
z = linspace(min(zi), max(zi), length(xi));
plot3(xi, yi, zi, 'o');

% Plot lines and circles at nodes
for i=1:length(xi)
   xpoint = linspace(xi(i), xi(i)); 
   ypoint = linspace(yi(i), yi(i));
   
   if(~isnan(realZ))
       zpoint = linspace(min(min(interp(:), realZ(:))), max(max(interp(:), realZ(:))));
   else
       zpoint = linspace(min(interp(:)), max(interp(:)));
   end
   plot3(xpoint, ypoint, zpoint);
end
scatter3(xi, yi, linspace(max(zpoint), max(zpoint), length(xi)), 'filled','k');
xlabel('x-axis', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k');
ylabel('y-axis', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k');
zlabel('z-axis', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k');
Title = sprintf('%s\nMax Error = %5.4e\nAverage Error = %5.4e', name, maxError, avgError);
title(Title);

end