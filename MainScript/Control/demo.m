function [ ] = demo()
%demo Démonstration du mouvement du robot
%   

global enabled_ddl;

% p0 = [NaN, NaN, NaN, NaN, NaN, NaN];
% for i = 1:6
%     if enabled_ddl(i)
%        p0(i)= 0; 
%     end
% end
% set_actual_p(p0);

% p0 = get_p();
% set_p(p0);

% move_rel([0, 0, 0, 0, NaN, NaN]);

%% Move back and forth
% p1 = [-256000, -256000, -160000, -160000, NaN, NaN];
% p2 = [256000, 256000, 160000, 160000, NaN, NaN];
% 
% for n = 1:20
%     set_p(p1);
%     pause();
%     set_p(p2);
%     pause();
% end




end

