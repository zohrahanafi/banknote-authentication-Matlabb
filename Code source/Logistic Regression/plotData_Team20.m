function plotData_Team20(X, Y)
figure; hold on;
% Trouver les donnee qui sont originaux y=0 et faux y=1
original = find(Y==0);
fake = find(Y == 1);

% Plot :
plot(X(original, 1), X(original, 2), 'r+');
plot(X(fake, 1), X(fake, 2), 'b*');
hold off;

end