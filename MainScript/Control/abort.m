function [finish] = abort(type)
%	[] = abort(type)
%   Fonction qui g�re la r�action aprendre si abort
%   PARAM�TRES:
%       type=   'lc': arr�t du au limiteur de couple
%               'ls':    arr�t du � la limit switch
%       finish: boolean 1 si finis 0 sinon

%% Gestion du cas
    is_complete=0;
    switch type
        case 'lc'
            q=get_p();
            message='Le contr�le du bras � �t� abort� car le limiteur de couple � d�clench�e';
            fprintf(strcat('\n',message,'\n'));
            is_complete=set_p(q);

        case 'ls'
            q=get_p();
            message='Le contr�le du bras � �t� abort� car une limit switch � d�clench�e';
            fprintf(strcat('\n',message,'\n'));
            is_complete=set_p(q);
    end
    if is_complete==0
       fprintf('\nGestion du stop non compl�t�')
    end
    finish=is_complete;
end

