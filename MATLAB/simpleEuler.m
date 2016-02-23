x = [0:h:1];

 y = 0*x;
 y(1) = starty;

 for i=2:max(size(y)),
    y(i) = y(i-1) + h/y(i-1);
 end

 true = sqrt(2*x+1);