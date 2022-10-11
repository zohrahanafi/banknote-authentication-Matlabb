%%Initialisation
clear; close all; clc;
%%load data 
data = load('data.txt');

% Part 1 : Deviser notre DataSet en 3 : * Training * Test * Validation ########
% Les 4 premiers colums c'est notre inputs, la derniere notre target .
X = data(:, [1:4]);
Y = data(:, 5);
% On prend 15 % pour le test et 15 % pour la validation 70 % pour le training 
 n= size(X, 1);
 nbrTest = int32((n *15) / 100)  ;
 nbrTrain = n- (nbrTest*2) ; % *2 car on prend 15% pour le test et 15% pour validation (30%)
 nbrValidation = nbrTrain +nbrTest ;
 %pour le train :
 X = data (1:nbrTrain , [1:4]);
 Y = data (1:nbrTrain , 5);
%pour le test 
Xtest = data (nbrTrain +1: nbrValidation , [1:4]);
Ytest = data (nbrTrain +1: nbrValidation , 5);
%our la validation :
XValidation = data (nbrValidation +1 : n , [1:4]);
YValidation = data (nbrValidation +1 : n , 5);

%###### Part 2 : Visualiser dataSet ######

plotData_Team20(X,Y);
hold on;
legend('original', 'fake')
hold off;

%########### Part 3 : Calculer le cost et gradient_descent ###########
[m,n]= size(X); 
X = [ones(m, 1) X];%Ajouter l'attribut X0 qui une colonne de 1 à la matrice X 
InitTheta=zeros((n + 1), 1); % on inicialise nos theta a 0 

[J]=Costfct_Team20(InitTheta,X,Y);

% Optimization avec Gradient-Decent :
alpha = 0.01;
nbr_ilterations=1000;
[theta,costJ]= gradientDescentfct_Team20(X,Y,InitTheta,alpha,nbr_ilterations);
%######### Part 4 : Nos resultas : ##########

fprintf('Cost trouve par gradient Descent: %f\n', costJ(nbr_ilterations)); % derniere valeur trouvee
fprintf('theta: \n');
fprintf(' %f \n', theta);
%# plot le cost function : 
figure ()
plot(1:length(costJ),costJ);
ylabel('Coût (J)');
xlabel('Iterations');
hold on;

%% test
[n1,m1]= size(Xtest);
Xtest = [ones(n1, 1) Xtest];

[n2,m2]= size(XValidation);
XValidation = [ones(n2, 1) XValidation];

%# Calcule de Precision :
train = round(sigmoid_Team20(X * theta));
validation=round(sigmoid_Team20(XValidation * theta));
test=round(sigmoid_Team20(Xtest * theta));
fprintf('Pourcentage de precesion est : %f\n',(mean(train==Y))*100);
fprintf('Pourcentage de validation est : %f\n',(mean(validation==YValidation))*100);
fprintf('Pourcentage de test est : %f\n',(mean(test==Ytest))*100);




