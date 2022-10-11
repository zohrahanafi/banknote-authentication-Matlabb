function [J]= Costfct_Team20(theta,x,y)
  m= length (y); % nombre de training examples
  h = sigmoid_Team20 (x * theta); %appel a la fonction d'hypothese pour le calcule du pourcentage
  % on utilise la vectorisation pour le calcul du cost 
  J = sum(-y' * log(h) - (1 - y')*log(1 - h)) / m;
end
