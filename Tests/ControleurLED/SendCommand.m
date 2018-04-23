function [reply] = SendCommand(port, ad, fctID, fctTYPE, value, motor)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DESCRIPTION DE LA FONCTION : fonction utilisée pour envoyer une commande 
%                              de 9 bytes au contrôleur.
% ENTRÉES :
%     port : string contenant le numéro du port COM à utiliser
%     ad : adresse du controleur
%     fctID : code de la fonction
%     fctTYPE : type de la fonction
%     value : valeur à envoyer au contrôleur
%     motor : numero du moteur, peut Être laissé vide
%
% SORTIES :
%     reply : réponse du contrôleur face à la commande envoyée.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(nargin == 5)
    motor = 0;
end

n = int32(value);

% 9 bytes à envoyer au contrôleur
% byte #1 : module address
% byte #2 : command number
% byte #3 : type number
% byte #4 : motor or bank number
% byte #5-8 : value 
% byte #9 : checksum

byte(1:4) = uint8([ad,fctID,fctTYPE,motor]);
byte(5) = uint8(bitand(bitshift(n,-24),255));
byte(6) = uint8(bitand(bitshift(n,-16),255));
byte(7) = uint8(bitand(bitshift(n,-8),255));
byte(8) = uint8(bitand(n,255));
byte(9) = uint8(bitand(sum(byte(1:8)),255));

% Pour s'assurer que tous les ports série sont fermés
delete(instrfindall)
clear serialPort

% Initialisation du port série
serialPort = serial(port);
set(serialPort, 'BaudRate',9600);
set(serialPort, 'DataBits', 8);
set(serialPort, 'Parity', 'none');
set(serialPort, 'StopBits', 1);
set(serialPort, 'FlowControl', 'none');
set(serialPort, 'Terminator', 'LF');
set(serialPort, 'Timeout',0.001); 

% Ouverture du port série
fopen(serialPort);

% Envoi de la commande (9 bytes) au contrôleur
fwrite(serialPort,byte); 

% Lecture du reply (9 bytes) du contrôleur
reply = fread(serialPort, 9,'uint8');

% Affichage du reply 
reply = dec2hex(reply);

% Fermeture du port série
fclose(serialPort);

end


