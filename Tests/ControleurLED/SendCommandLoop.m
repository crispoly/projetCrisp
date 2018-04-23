function [ message ] = SendCommandLoop(  port, ad, fctID, fctTYPE, value, motor )
%Fonction utilisee pour envoyer une commande de 9 byte au controleur en
%utilisant un loop pour envoyer un byte a la fois
% port: String contenant le COM a utiliser
% ad: Adresse du controleur
% fctID: Code de la fonction
% fctTYPE: Type de la fonction
% value: Valeur a envoyer au controleur
% motor: numero du moteur, peut etre laisser vide

if(nargin == 5)
    motor = 0;
end

n = int32(value);


% Defini le byte a envoyer au controleur en utilisant les parametres
% predefinis
byte(1:4) = uint8([ad,fctID,fctTYPE,motor]);
byte(5)= uint8(bitand(bitshift(n,-24),255) );
byte(6)= uint8(bitand(bitshift(n,-16),255) );
byte(7)= uint8(bitand(bitshift(n,-8),255) );
byte(8)= uint8(bitand(n,255) );
byte(9)=uint8(bitand(sum(byte(1:8)),255) );


% Initialisation de la communication serielle
fid = serial(port,'BaudRate',9600,'DataBits',8,'Parity','none', 'StopBits',1,'FlowControl','none');
fopen(fid); %Ouvre la connection

for(i=1:1:9)
fwrite(fid,byte(i)); % Envoi de la commande
message(i) = fread(fid, 9,'uint8'); %Tester les reponses pour voir comment gerer les commandes mal 
end

fclose(fid);

end

