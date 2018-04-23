%%Initialiser les valeurs du controleur
port = 'COM12'; % Port de la connexion
ad = 1; % Adresse du controleur
fctID = 15; % Fonction pour Set Output
fctTYPE = 0;
motor = 0; % OUTPUT du controleur
value =0;

%% Essai Sans Loop
SendCommand(port, ad, fctID, fctTYPE, value, motor)

%% Essai Avec Loop
% SendCommandLoop(port, ad, fctID, fctTYPE, value, motor);