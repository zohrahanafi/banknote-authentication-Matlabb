clear; close all; clc;

data = load('banknote.txt');
% pour l'apprentissage
input = data(1:960,1:4);  
output = data(1:960,5);

% pour le test
input_test = data(960:1166,1:4); 
output_test = data(960:1166,5);

% pour la validation
input_validation = data(1166:1372, 1:4); 
output_validation = data(1166:1372, 5);

% initialisation
alpha=0.5;
lambda=10^(-4);
nbr_iter= 2000;
theta1=rand(3,5);   %couche cachée de 3 noeuds
theta2=rand(1,4);   %pour aller vers le output
m = length(input);
input=[ones(m,1),input];  %ajouter le biais

i=1;
while i <= nbr_iter
    bdelta1=zeros(6,5);
    bdelta2=zeros(1,7);
    
    % Forward propogation
    
    [a2,h] = forward_propagation_TEAM_20(input , theta1,theta2,m);
    
    % Backpropogation
    
  [theta1,theta2] = back_probagation_TEAM_20(input, a2 , theta1 , theta2 , output , h, m, lambda, alpha);
    i=i+1;
end

% Apprentissage 
[atrain2,httrain] = forward_propagation_TEAM_20(input , theta1 , theta2 , m);
httrain=httrain>=0.5;  
err = abs(httrain-output); 
err = sum(err~=0);   
apprentissage = (1-(err/m))*100;

fprintf("La performance de l'apprentissage est: ");
apprentissage


% Test
mtest=length(input_test);
input_test=[ones(mtest,1), input_test];  %ajouter le biais
[atest2,htest] = forward_propagation_TEAM_20(input_test , theta1,theta2,mtest); %calculer le forward du test
htt=htest>=0.5;

error=abs(htt-output_test);
errors=sum(error~=0);
test=(1-(errors/mtest))*100;
fprintf("La performance de du test est: ")
test

% Validation
mval=length(input_validation);
input_validation=[ones(mval,1), input_validation];  %ajouter le biais
[aval2,hval] = forward_propagation_TEAM_20(input_validation , theta1,theta2,mval); %calculer le forward du test
htt=hval>=0.5;

error=abs(htt-output_validation);
errors=sum(error~=0);
validation=(1-(errors/mtest))*100;
fprintf("La performance de du test est: ")
validation