function Plot3D(xplane, yplane, xi, yi, zi, interp, name, realZ)

figure
colormap jet
surf(xplane, yplane, interp, 'EdgeColor', 'interp'); hold on
freezeColors
color winter
if (~isnan(realZ))
   surf(xplane, yplane, realZ, 'EdgeColor', 'interp');
end
plot3(xi, yi, zi, 'o');
title(name);

end