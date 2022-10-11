vecteur = zeros(1000,1);
vecteur([300 500]) = 1;
coefficients_ondelette = cwt(vecteur,1:128,'db4');
plot(coefficients_ondelette(80,:));
grid on;