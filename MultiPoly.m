function interp  = MultiPoly(xi, yi, zi, X, Y)
            m = length(xi)
            Vand = createVandermonde(m, xi, yi)
            coef = Vand\zi(:),
%             %Plotting
%             x = linspace(min(xi), max(xi));
%             y = linspace(min(yi), max(yi));
%             [X,Y] = meshgrid(x,y);
            for i=1:100
                for j=1:100
                polyAtPoint = createCombination(m, X(i,j), Y(i,j));
                interp(i,j) = polyAtPoint * coef;
                end
            end
           
%             colormap hsv
%             surf(X,Y,interp, 'EdgeColor', 'interp'); hold on
          
end    

           
function V = createVandermonde(m, xi, yi)
   V = zeros(m, m);
   for row=1:m
       %row,
       %V(row,:) = createCombination(obj, m, obj.xi(row), obj.yi(row));
       sprintf('xi(row) = %20.16f', xi(row));
       someVar = createCombination(m, xi(row), yi(row)); %Extra var for debugging TODO
       V(row,:) = someVar;
   end 
end
        
function c = createCombination(m, x, y)
   %x,
   %y,
   maxDegree = floor(sqrt(m-1));
   %maxDegree,
   tempIndex = 1;

   for i=maxDegree:-1:0
      for j=i:-1:0
          temp1(tempIndex) = (x^i) * (y^j);
          if(i ~= j)
            temp2(tempIndex) = (x^j) * (y^i);
          else
              temp2(tempIndex) = NaN;
          end
          tempIndex = tempIndex + 1;
      end
   end
   %temp1,
   %temp2,
   c = weaveFunctions(temp1, temp2, m);
end
    
%Takes two vectors and weaves them together, resulting vector is
%of length, size. Starts with first argument, skips and NaNs.
function w = weaveFunctions(vector1, vector2, size)
    p1 = length(vector1); p2 = length(vector2);
    p_switch = 1;
    w = [];
    i = size;
    while(i > 0)
        %i,
        if(p_switch == 1)
            if(isnan(vector1(p1)))
               i = i + 1;
            else
               w(i) = vector1(p1);
           end
           p1 = p1 - 1;
           p_switch = 2;
        else
           if(isnan(vector2(p2)))
               i = i + 1;
           else
               w(i) = vector2(p2);
           end
           p2 = p2 - 1;
           p_switch = 1;
        end
        i = i - 1;
    end
end


