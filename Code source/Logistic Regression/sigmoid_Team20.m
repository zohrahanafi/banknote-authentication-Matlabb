function g= sigmoid_Team20 (z) 
  g= zeros (size (z));
  g= 1 ./ ( 1 + exp( -1 * z ));
end
