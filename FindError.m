function [z, maxError, avgError] = FindError(f, X, Y, interp)

z = f(X, Y);
err = abs(z - interp);
maxError = max(err(:));
avgError = mean(err(:));

end

