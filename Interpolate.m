function interp  = Interpolate(xi, yi, zi, X, Y)
            m = length(xi);
            Vand = createVandermonde(m, xi, yi);
            coef = Vand\zi(:),
            
            for i=1:100
                for j=1:100
                polyAtPoint = createCombination(m, X(i, j), Y(i, j));
                interp(i, j) = polyAtPoint * coef;
                end
            end     
end    

           
function V = createVandermonde(m, xi, yi)
   V = zeros(m, m);
   
   for row=1:m
       sprintf('xi(row) = %20.16f', xi(row));
       V(row,:) = createCombination(m, xi(row), yi(row));
   end 
end
        
function c = createCombination(m, x, y)
   maxDegree = floor(sqrt(m - 1));
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


