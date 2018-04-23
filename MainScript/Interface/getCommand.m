function [ unused ] = getCommand(func )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction qui demande la commande a l'utilisateur et retourne la commande
% a evaluer
%Entrees:
%   inputfunc :  un string contenant la fonction entree par l'utilisateur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global funcMat;
par = strfind(func,'(');
str = func(1:par-1);
value = func(par+1:end-1);
value = str2num(value);
if(any(strcmp(str,funcMat)))
    commande = str2func(str);
    if(isempty(value))
        commande();
    else
    commande(value);
    end
else
    
end


end

