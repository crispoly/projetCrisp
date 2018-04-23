function [ ] = init_communications( )
%init_communications Initialisation de la layer communication
%   Maping du memmapfile
%   Démarrage du CommBot
%   Initialisation des variables globales (communication)


global map commBot;


fprintf('Initiating communications\n');


%% Maping du memmapfile
map = get_memmapfile();

%% Démarrage du CommBot
init_commfile();


% if strcmp(read_parameter('BATCH_COMMBOT'),'true')
%     fprintf('Starting CommBot\n');
%     commBot = batch('Communication.CommBot');
%     fprintf('CommBot state: %s\n', get(commBot, 'State'))
% elseif strcmp(read_parameter('BATCH_COMMBOT'),'false')
%     fprintf('BATCH_COMMBOT in parameter file is set to false. Please start the CommBot manually in another matlab session then press any key.\n')
%     pause();
% else
%     fprintf('BATCH_COMMBOT in parameter file is invalid! CommBot will not be started.\n')
% end

fprintf('BATCH_COMMBOT in parameter file is set to false. Please start the CommBot manually in another matlab session then press any key.\n')
pause();
    

init_moteurs();


%     fprintf('Starting CommBot\n');
%     commBot = batch('CommBot');

end

