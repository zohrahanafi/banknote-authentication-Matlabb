function [theta1,theta2] = back_probagation_TEAM_20(input, a2 , theta1 , theta2 , output , h, m, lambda, alpha)
  
    delta3 = h - output ;  %l'erreur de la dernière couche
    delta2=(theta2'*delta3').*(a2.*(1-a2));
    delta2(1,:)=[];
    
    bdelta1=delta2*input;
    bdelta2=(delta3')*a2';
    
    D1=bdelta1/m;
    D2=bdelta2/m;
    D1(:,2:end)=D1(:,2:end)+(lambda*theta1(:,2:end));
    D2(:,2:end)=D2(:,2:end)+(lambda*theta2(:,2:end));
    
    theta1=theta1-alpha*D1;
    theta2=theta2-alpha*D2;
  
endfunction

