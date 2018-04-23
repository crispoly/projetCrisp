function [ traj] = cree_spline( trajectoire,deltaTempsSpline )
%   [ traj] = cree_spline( trajectoire,deltaTempsSpline )
%   FONCTION QUI CRÉÉ UNE SPLINE D'INTERPOLATION POUR UNE TRAJCTOIRE
%   PARAMÈTRES DE LA FONCTION:
%       trajectoire:        matrice de colonnes de trajectoire de la forme 
%                           [temps(1), pos_x(1),pos_y(1),pos_z(1)]
%                           [temps(2), pos_x(2),pos_y(2),pos_z(2)]
%                               ...     ...        ...     ...
%       traj:               matrice de colonnes de la spline de la forme 
%                           [temps(1), pos_x(1),pos_y(1),pos_z(1)]
%                           [temps(2), pos_x(2),pos_y(2),pos_z(2)]
%                               ...     ...        ...     ...
%       deltaTempsSpline:   Intervale de temps entre les points
%                           d'interpolation de la spline
%% Discrétisation en temps
temps=1:deltaTempsSpline:trajectoire(end,1);

%% Production de la spline
xx=spline(trajectoire(:,1),trajectoire(:,2),temps');
yy=spline(trajectoire(:,1),trajectoire(:,3),temps');
zz=spline(trajectoire(:,1),trajectoire(:,4),temps');

%% Trajectoire du mouvement interpolé
traj=[temps',xx,yy,zz]                  

end

