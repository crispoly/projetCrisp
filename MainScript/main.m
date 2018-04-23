%%% Initialisation des Variables et des constantes du systeme
close all;
clear all;
clc;

addpath(genpath('Communication'));
addpath(genpath('Control'));
% addpath(genpath('Interface'));


global enabled_ddl;

enabled_ddl = [1, 1, 1, 1, 0, 0];

init();

%% Boucle principale
% exit = false;
% while ~exit
%     
%     %% Recevoir une commande de l'utilisateur
%     
%     % Si la commande est de sortir -> exit = true
%     
%     %% Lancer la commande
%     
% end

demo();
% free();


%% Shut Down Sequence

