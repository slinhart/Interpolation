%This Class will contains properties and methods relevant to polynomial
%multivariate interpolation.
classdef MultiPoly
    
    properties
        lspace;      %linspace to be used for this instance TODO: this may not belong
        xi;          %Vector of sample points on x-axis
        yi;          %Vector of sample points on y-axis
        zi;          %Vector of sample points on z-axis
        vandermonde; %The Vandermonde matrix, created from the x's and y's
        coef;        %The resulting vector from A\zi (The coefficients)
        interp;      %The final interpolated function
        
        %TODO make a property to contain the combintaion (result after
        %weave), so in terms of x and y. need to figure out how to return a
        %function i think
    end
    
    methods
        %Constructor
        function obj  = MultiPoly(xPoints, yPoints, zPoints)
            obj.xi = xPoints;
            obj.yi = yPoints;
            obj.zi = zPoints;
        end
        
        %Interpolate
        function interpolate = interpolate(obj, x, y)
            m = length(obj.xi);
            Vand = createVandermonde(obj);
            obj.coef = Vand\obj.zi(:);
            interpolate = obj.coef * createCombination(obj, m, x .* ones(1,m), y .* ones(1,m));
            obj.interp = interpolate;
        end
    end
    
    %Private (helper) methods. [Methods that cannot be called from outside
    %of this class
    methods (Access = private)
        
        function V = createVandermonde(obj)
           m = length(obj.xi);
           V = zeros(m,m);
           
           for row=1:m
               %V(row,:) = createCombination(obj, m, obj.xi(row), obj.yi(row));
               someVar = createCombination(obj, m, obj.xi(row), obj.yi(row)); %Extra var for debugging TODO
               V(row,:) = someVar;
           end 
        end
        
        function c = createCombination(obj, m, x, y)
           maxDegree = floor(sqrt(m));
           tempIndex = 1;
           
           for i=maxDegree:-1:0
              for j=i:-1:0
                  temp1(tempIndex) = x.^i * (y.^j)';
                  if(i ~= j)
                    temp2(tempIndex) = x.^j * (y.^i)';
                  else
                      temp2(tempIndex) = NaN;
                  end
                  tempIndex = tempIndex + 1;
              end
           end
           c = weaveFunctions(obj, temp1, temp2, m);
        end
    
        %Takes two vectors and weaves them together, resulting vector is
        %of length, size. Starts with first argument, skips and NaNs.
        function w = weaveFunctions(obj, vector1, vector2, size)
            p1 = length(vector1); p2 = length(vector2);
            p_switch = 1;
            w = [];
            
            for i=size:-1:1
                if(p_switch == 1)
                    if(isnan(vector1(p1)))
                       i = i - 1;
                    else
                       w(i) = vector1(p1);
                   end
                   p1 = p1 - 1;
                   p_switch = 2;
                else
                   if(isnan(vector2(p2)))
                       i = i - 1;
                   else
                       w(i) = vector2(p2);
                   end
                   p2 = p2 - 1;
                   p_switch = 1;
                end
            end
        end
    end
end

