function [ finish ] = control( trajectoire)
%[ Finish ] = control( abort )
%   FONCTION QUI GÈRE LE CONTRÔLE DU ROBOT ET ASSURE LE SUIVI DE LA TRAJECTOIRE
%   Paramètres de la fonction:
%       trajectoire:        matrice colonne de trajectoire de la forme 
%                           [temps, postionx,positiony,positionz]
%       abort:  boolean:    0 si aucun arrêt nécessaire
%                           1 si un arrêt doit être exécuté
%       finish: boolean:    0 si le controle rencontre un problème
%                           1 sinon

%% Déclaration des variables
    stop=0;
    finish=0;
    count=1;

%% Créer la spline d'interpolation
    deltaTempsSpline=0.005;                 %Intervale de temps de la spline
    [traj] = cree_spline( trajectoire,deltaTempsSpline )

%%
    r=zeros(length(xx),1);
    p=zeros(length(xx),1);
    ya=zeros(length(xx),1);
%% Réaliser la dynamique inverse
    q = noap( xx,yy,zz,r,p,ya );

    dq=[zeros(1,6);
        (q(2:end,:)-q(1:end-1,:))./deltaTempsSpline];
    ddq=[zeros(1,6);
        (dq(2:end,:)-dq(1:end-1,:))./deltaTempsSpline];
%% Start Loop
while or(stop~=1,count<=length(xx))
    
%% Vérifier sensor
    out_capteur=is_capteur_ok();

%% Function handle du cas ou abort
    if out_capteur.etat==0
        finish = abort(out_capteur.cause);
        stop=1;
    end
%% Début de la commande

    is_complete=set_p(q(count,:));

    if is_complete==0
        fprintf('\n Erreur dans l''envoi de la commande au moteurs iter %d',count)
    stop=1;
    end
count=count+1;
end

end

