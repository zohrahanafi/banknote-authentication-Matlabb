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
Xtest = data (nbrTrain: nbrValidation , [1:4]);
Ytest = data (nbrTrain: nbrValidation , 5);
%our la validation :
XValidation = data (nbrValidation : n , [1:4]);
YValidation = data (nbrValidation : n , 5);

tree = fitctree(X,Y); %creation du modele
view (tree,'mode','graph'); % affichier l'arabre

p=predict(tree,Xtest);
moyenneT = mean(p==Ytest)*100;
fprintf('Pourcentage de test est : %f\n',moyenneT);

p2=predict(tree,XValidation);
moyenneT2 = mean(p2==YValidation)*100;
fprintf('Pourcentage de vaidation est : %f\n',moyenneT2);
