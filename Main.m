%Main Script

xi = [3, 3, 4, 4];
yi = [3, 4, 3, 4];
zi = [5, 6, 7, 9];

poly = MultiPoly(xi, yi, zi);

debugans = interpolate(poly, xi, yi);

interpZ = poly.interp;

debugans,
interpZ,