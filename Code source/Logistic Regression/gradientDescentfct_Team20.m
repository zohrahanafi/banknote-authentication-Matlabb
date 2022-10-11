function [theta,cost] = gradientDescentfct_Team20(X, Y, theta, alpha, nbr_ilt)

m = length(Y); 

for i = 1:nbr_ilt
    h = sigmoid_Team20(X*theta);
    derive = (X'*(h - Y))/m;
    theta = theta - alpha*derive;  
    cost(i) = Costfct_Team20(theta,X,Y); 
end
end