function [z, err] = FindError(f, X, Y, interp)

z = f(X, Y);
err = abs(z - interp);
a = max(err(:)),
b = mean(err(:)),

end

