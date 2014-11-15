%%% Highest level function that returns all the 3D values.
%%% xi: x-inputs
%%% yi: y-inputs
%%% zi: z-inputs
%%% X,Y: together form the X-Y plane
function interp  = Interpolate(xi, yi, zi, X, Y)
            linspaceSize = 100; % Length of linspace.
            
            if(length(xi) ~= length(yi) || length(xi) ~= length(zi)) % Check for valid input
                interp = NaN; disp('Sample Inputs are not the same size');
                return;
            end
            m = length(xi); % m represents the number of data inputs 
            Vand = createVandermonde(m, xi, yi); % Create the Vandermonde matrix
            coef = Vand\zi(:); % Find the coefficient matrix by using Gauss operator.
            
            % Foreach discrete point on the XY plane
            for i=1:linspaceSize
                for j=1:linspaceSize
                polyAtPoint = createCombination(m, X(i, j), Y(i, j)); % Create the polynomial combination (Same ones used in Vandermonde Matrix)
                interp(i, j) = polyAtPoint * coef; % multiply the coefficient matrix by the respecitive polynomial to get the associated z value.
                end
            end     
end    

%%% High level function that controls the creation of the Vandermonde matrix          
function V = createVandermonde(m, xi, yi)
   V = zeros(m, m);
   
   for row=1:m
       sprintf('xi(row) = %20.16f', xi(row));
       V(row,:) = createCombination(m, xi(row), yi(row)); % Lower level function that creates a row of the Vandermonde Matrix
   end 
end

%%% Creates a polynomial combination (rows of the Vandermonde matrix)
function c = createCombination(m, x, y)
   maxDegree = floor(sqrt(m - 1)); % Forumla for maximum degree of the polynomial combination
   tempIndex = 1; % Used to index temporary vector of terms

   % Create two vectors
   % temp1 will contain terms where x is higher degree than y (or same)
   % temp2 will contain terms where x is of lower degree than y (temp2 will
   % contain NaNs when the degrees are equal
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
   
   % Weave the two temporary function so that the resulting vector will
   % contain only as many terms that are needed, and ordered in a efficient
   % way (using as few higher degree terms as possible)
   c = weaveFunctions(temp1, temp2, m);
end
    
%Takes two vectors and weaves them together, resulting vector is
%of length, size. Starts with first argument, skips and NaNs.
function w = weaveFunctions(vector1, vector2, size)
    p1 = length(vector1); p2 = length(vector2);
    p_switch = 1;
    w = [];
    i = size;
    
    % Alternate elements from temp1 and temp2 into w, skip NaNs
    while(i > 0)
        if(p_switch == 1) % If its temp1's turn in the alternation
            if(isnan(vector1(p1)))
               i = i + 1; % Since NaN is not used, move w's index back
            else
               w(i) = vector1(p1);
           end
           p1 = p1 - 1; % Move temp1's index
           p_switch = 2; % After temp1's turn, switch to temp2's turn
        else             % If its temp2's turn in the alternation
           if(isnan(vector2(p2)))
               i = i + 1; % Since NaN is not used, move w's index back
           else
               w(i) = vector2(p2);
           end
           p2 = p2 - 1; % Move temp2's index
           p_switch = 1; % After temp2's turn, switch to temp1's turn
        end
        i = i - 1; % Move w's index
    end
end


