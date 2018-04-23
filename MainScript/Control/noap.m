function [ q,is_possible] = noap( x,y,z,r,p,ya )
%[ q] = noap( x,y,x,r,p,ya )
%   Fonction qui donne la dynamique inverse 
%   DESCRIPTION DES PARAMÈTRES
%       q:              Matrice  d'angle moteur
%                       de la forme: q=[q1,q2,q3,q4,q5,q6];

%   **  attention cette fonction s'arrête à q4 et la dynamique inverse à été
%       réalisée seulement pour les test du bras concu jusqu'à date

%       x,y,z:          Position au bout du bras
%       r,p,ya:         Roll, pitch,yaw en radians
%       is_possible:    Boolean 1 si combinaison possible 0 sinon   
 
%% Déclaration des variables
is_possible=1;

transform = RPY(r,p,ya);
nx=transform.nx;ox=transform.ox;ax=transform.ax;px=x; 
ny=transform.ny;oy=transform.oy;ay=transform.ay;py=y;
nz=transform.nz;oz=transform.oz;az=transform.az;pz=z;

%% Calcul des angles de la dynamique inverse
q1=atan2(oy,ox);
q2=atan2(az,ox.*cos(q1)+oy.*sin(q1));
    C=ox.*sin(q1)-oy.*cos(q1);
    D=ox.*cos(q2).*cos(q1)-oy.*cos(q2).*sin(q1)+oz.*sin(q2);
    E=oy.*cos(q2).*sin(q1)+ox.*cos(q2).*cos(q1)+oz.*sin(q2);
    F=oy.*cos(q1)-ox.*sin(q1);
q3=atan2(F-D,C-E);
q4=q3-atan2(ny,nx.*cos(q1-q1)+nz.*sin(1-2));

q5=zeros(length(q4),1);       %ATTENTION Q5 ET Q6 SONT FIXÉ INTENTIONNELEMENT À 0 ET 
q6=zeros(length(q4),1);       %POUR LE BRAS COMPLET DEVRONT ÊTRE CHANGÉ

q=[q1 q2 q3 q4 q5 q6];
%% Vérification de la validité


% T04=[cos(q4)*(sin(q1)*sin(q3) + cos(q1)*cos(q2)*cos(q3)) - sin(q4)*(cos(q3)*sin(q1) - cos(q1)*cos(q2)*sin(q3)), cos(q1)*sin(q2), - cos(q4)*(cos(q3)*sin(q1) - cos(q1)*cos(q2)*sin(q3)) - sin(q4)*(sin(q1)*sin(q3) + cos(q1)*cos(q2)*cos(q3)), (19*cos(q4)*(sin(q1)*sin(q3) + cos(q1)*cos(q2)*cos(q3)))/1000 - (19*sin(q4)*(cos(q3)*sin(q1) - cos(q1)*cos(q2)*sin(q3)))/1000 + (cos(q1)*(1688*cos(q2) + 7550*sin(q2) + 1775))/25000;
%     sin(q4)*(cos(q1)*cos(q3) + cos(q2)*sin(q1)*sin(q3)) - cos(q4)*(cos(q1)*sin(q3) - cos(q2)*cos(q3)*sin(q1)), sin(q1)*sin(q2),   cos(q4)*(cos(q1)*cos(q3) + cos(q2)*sin(q1)*sin(q3)) + sin(q4)*(cos(q1)*sin(q3) - cos(q2)*cos(q3)*sin(q1)), (19*sin(q4)*(cos(q1)*cos(q3) + cos(q2)*sin(q1)*sin(q3)))/1000 - (19*cos(q4)*(cos(q1)*sin(q3) - cos(q2)*cos(q3)*sin(q1)))/1000 + (sin(q1)*(1688*cos(q2) + 7550*sin(q2) + 1775))/25000;
%     sin(q2)*cos(q3-q4),-cos(q2), sin(q2)*sin(q3-q4), (211*sin(q2))/3125 - (151*cos(q2))/500 + (19*cos(q3)*cos(q4)*sin(q2))/1000 + (19*sin(q2)*sin(q3)*sin(q4))/1000 + 87/1000;
%     0,0,0,1];
% err=abs(T04-transform);
% if any(err >0.01)
%     fprintf('\nLa position donnée est inatteignable car les coefficients suivant de la matrice noap ne peuvent être atteint:\n')
%     for i=1:4
%         for j=1:4
%             switch err(i,j) >0.01
%                 case 1
%                     fprintf('noap ligne %i, colone %i\n',i,j)
%                 case 0
%             end
%         end
%     end
%     is_possible=0
% end
% disp(err)




end

