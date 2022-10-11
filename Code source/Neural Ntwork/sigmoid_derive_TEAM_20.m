function [sortie] = sigmoid_derive_TEAM_20(input)
  for i=1:size(input,2)
    sortie(1,i)=exp(-input(1,i))/((1+exp(-input(1,i)))^2);
    end
endfunction