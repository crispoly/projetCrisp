function qf = cine_inverse(RobotC06, NOAP_target, q0)
% NAOP_target = position désirée (classe SE3)
% RobotC = configuration du Robot Crisp à 6 articulations sans poignet (SerialLink à 6 repères)
% q0 = configuration initiale (1x6 ou 1x7)
% qf = configuration finale à la position de l'outil NOAP_cible (1x7)

d7 = 0; %Retrait du dernier SerialLink (Distance poignet-effecteur)
a7 = 0;
T67 = SE3;
T67.t = [-a7; 0; -d7];
NOAP_target = NOAP_target*T67;

[qf, err] = RobotC06.ikcon(NOAP_target,q0(1:6));
qf(7) = 0;            





% %Valeurs cible
% alpha = 0.005;
% erreur = 1;
% % Ajustement du parametre alpha de la descente du gradient
% while(erreur > 0.1)
%     desc = alpha*pinv(RobotC.jacobe(q0))*(x_cible-x0);
%     qf = q0 - desc;
%     xf = cine_directe06(qf);
%     erreur = norm(qf-q0,inf);
%     if(erreur > 0.01)
%         alpha = alpha/2;
%     end
% end
% Q = [q0, qf];
% % Descente du grandiant
% 
% while(norm(x_cible-xf) > 0.1) 
%     desc = alpha*pinv(RobotC.jacobe(qf))*(x_cible-cine_directe06(qf));
%     qf = qf - desc;
%     xf = cine_directe06(qf);
%     Q = [Q, qf];
%     qf
% end
% 
% 
% end