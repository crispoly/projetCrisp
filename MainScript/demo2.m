function [ ] = demo2()
%demo Démonstration du mouvement du robot
%   

global enabled_ddl;
%% Pratt Et whitney
DlgH = figure;
H = uicontrol('Style', 'PushButton', ...
                    'String', 'ARRÊT', ...
                    'Callback', 'delete(gcbf)');
set_p([0 0 0 0 0 0]);
while (ishandle(H))
   set_p([356000 -400000 800000 256000 0 0])
   pause(4);
   set_p([-356000 0 800000 100000 0 0])
   pause(4);
   set_p([356000 -400000 0 0 0 0])
   pause(4);
   set_p([-356000 0 0 100000 0 0])
   pause(4);
end
   set_p([0 0 0 0 0 0]);
   
end
