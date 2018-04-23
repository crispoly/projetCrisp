%%Initialiser les valeurs du controleur
port = 'COM3'; % Port de la connexion
ad = 1; % Adresse du controleur
fctID = 1; % Fonction pour Set Output
fctTYPE = 0;
motor = 0; % OUTPUT du controleur
value =4000;

%% Essai Sans Loop
SendCommand(port, ad, fctID, fctTYPE, value, motor);

