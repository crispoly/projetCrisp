%%% Initialisation des Variables et des constantes du systeme
close all;
clear all;
clc; 

% Ajout des emplacements des fichiers & fonctions du programme
addpath(genpath('  '))
addpath(genpath('Control'))
addpath(genpath( 'Communication'))

%Initialisation des degr�s de libert�s 1 � 6 et la main (7)
global enabled_ddl
enabled_ddl = [1, 1, 0, 0, 0, 0, 0];

%Ouverture d'une nouvelle fen�tre Matlab pour l'ex�cution du Commbot
%!"C:\Program Files\MATLAB\R2019b\bin\matlab.exe" -r "CommBot"

%Fonction d'initialisation du syst�me
init();
