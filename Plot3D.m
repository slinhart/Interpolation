function Plot3D(xplane, yplane, xi, yi, zi, interp)

figure
colormap hsv
surf(xplane, yplane, interp, 'EdgeColor', 'interp'); hold on
plot3(xi, yi, zi, 'o');

end