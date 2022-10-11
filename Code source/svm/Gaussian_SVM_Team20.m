%% Initialisation
clear; close all; clc;

%% Importation de la base de donnees
data = load('BankNote_Authentification_Team20.txt');

%% Division de la base de donnee en 3 : 70% Entrainement, 15% test, 15% validation

%% Input : 4 premieres colonnes 
%% Output (target) : 5 eme colonne
X = data(:, [1:4]);
Y = data(:, 5);

s = size(X, 1);
nbrTest = int32((s*15) / 100);
% *2 car on prend 15% pour le test et 15% pour validation (30%)
nbrTrain = s - (nbrTest * 2);
nbrValidation = nbrTrain + nbrTest;

%% Entrainement :
X = data(1:nbrTrain, [1:4]);
Y = data(1:nbrTrain, 5);

%% Test : 
Xtest = data (nbrTrain: nbrValidation , [1:4]);
Ytest = data (nbrTrain: nbrValidation , 5);

%% Validation :
XValidation = data (nbrValidation : s , [1:4]);
YValidation = data (nbrValidation : s , 5);

%% Gaussian Kernel :
model = fitcsvm(X, Y, 'KernelFunction', 'rbf');
Ypredict = predict(model, Xtest);

pourcentage_test = mean(double(Ypredict == Ytest))*100;

YpredictValidation = predict(model, XValidation);

pourcentage_validation = mean(double(YpredictValidation == YValidation))*100;

%% Affichage des pourcentages :
fprintf('Précision pour le test: %f \n', pourcentage_test);
fprintf('Précision pour la validation: %f \n', pourcentage_validation);
