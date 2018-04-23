function [finish] = abort(type)
%	[] = abort(type)
%   Fonction qui gère la réaction aprendre si abort
%   PARAMÈTRES:
%       type=   'lc': arrêt du au limiteur de couple
%               'ls':    arrêt du à la limit switch
%       finish: boolean 1 si finis 0 sinon

%% Gestion du cas
    is_complete=0;
    switch type
        case 'lc'
            q=get_p();
            message='Le contrôle du bras à été aborté car le limiteur de couple à déclenchée';
            fprintf(strcat('\n',message,'\n'));
            is_complete=set_p(q);

        case 'ls'
            q=get_p();
            message='Le contrôle du bras à été aborté car une limit switch à déclenchée';
            fprintf(strcat('\n',message,'\n'));
            is_complete=set_p(q);
    end
    if is_complete==0
       fprintf('\nGestion du stop non complété')
    end
    finish=is_complete;
end

