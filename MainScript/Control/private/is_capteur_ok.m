function [ out_capteur ] = is_capteur_ok()
%   [ out_capteur ] = is_capteur_ok()
%   FONCTION QUI VÉRIFIE L'ÉTAT DES CAPTEURS
%   PARAMÈTRES DE LA FONCTION:
%       out_capteur.etat:    boolean 1 si ok 0 sinon
%       out_capteur.cause:   'ls' ou 'lc'
%% Chargement des données des capteurs
    capteur=etatCapteur();
    
%% Handle du cas si un des capteur n'est pas ok
    out_capteur.etat=1;
    
    if any(capteur.ls)
        for i=1:length(capteur.ls)
            switch capteur.ls(i)
                case 1
                    fprintf('\n limite %d atteinte pour le joint %d',capteur.ls(i),i)
                    out_capteur.etat=0;
                    out_capteur.cause='ls';
            end
        end
            
    elseif any(capteur.lc)
        for i=1:length(capteur.lc)
            switch capteur.lc(i)
                case 1
                    fprintf('\n Le limiteur de couple est déclenché pour le moteur %d',i)
                    out_capteur.etat=0;
                    out_capteur.cause='lc';
            end
        end
    end

end

