function [a2,h] = forward_propagation_TEAM_20(input , theta1,theta2,m)
    z2=theta1*input';   %   3x5   5x960  =  3x960
    a2=sigmoid_TEAM_20(z2);    %calcul des noeuds d'activation de la 2eme couche
    a2=[ones(1,m);a2];    %    4*960
    z3=theta2*a2;     %1x4   4x960 = 1x960
    z3=z3(:);   %ajuster dans une seule colonne  960x1
    h=sigmoid_TEAM_20(z3);    %calcul de l'hypothèse
endfunction
