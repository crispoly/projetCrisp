function [] = calibrate()
%calibrate Calibration du robot.
%   Un moteur à la fois, on bouge jusqu'à-ce qu'on atteingne la limit
%   switch. La valeur actuelle de l'encodeur est ensuite mise à jour.
%   L'articulation se positionne ensuite à 0.

global enabled_ddl;
v = 100;

q0 = [0, 0, 0, 0, 0, 0];    %Position quand les limit switch sont activées.
q = [NaN, NaN, NaN, NaN, NaN, NaN];
for i = 1:6
   if enabled_ddl(i)
       set_v((1:6==i)*v);
       ls = get_ls();
       while ~ls(i,1)   %Attend que la limit switch soit atteinte
           ls = get_ls();
           pause(0.05);
       end
       q_now = get_p();
       q(i) = q_now(i);
       set_actual_p(q);
       q(i) = 0;
       set_p(q);
       pause(3);
       q(i) = NaN;
   end
end

end

