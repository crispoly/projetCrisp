%%% Initialisation des Variables et des constantes du systeme
close all;
clear all;
clc;

addpath(genpath('Communication'));
addpath(genpath('Control'));
addpath(genpath('Interface'));


%% Initialisation de la communication

% % Serial Port Setup
% COMport = read_parameter('PORT');
% BaudRate = str2num(read_parameter('BAUD'));
% COMport = COMport(1:end-2);  %to be removed
% prompt = ['Port COM est presentement ', COMport, ' change? [y/n] '];
% COMset = input(prompt,'s');
% if COMset == 'y'
%     COMport = input('Port? [COMxx]: ','s');
%     fprintf('\n COM set to %s \n',COMport);
%     %write_parameter('PORT',COMport);
% end
% fprintf('Baudrate set to : %6.0f \n', BaudRate);
% fprintf('Initializing Serial Connection \n');

init_communications();


%% Initialisation de l'interface

init_interface();


%% Calibration
% Bouger chaque moteur 

%% Boucle principale
exit = false;
while ~exit
    
    %% Recevoir une commande de l'utilisateur
    
    % Si la commande est de sortir -> exit = true
    
    %% Lancer la commande
    
end


%% Shut Down Sequence

