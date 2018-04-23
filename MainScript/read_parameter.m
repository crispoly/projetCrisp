function [ value ] = read_parameter( name )
%read_parameter Fonction pour lire un paramètre situé dans le fichier texte
%   «parameters.txt»
%   La valeur retournée est de type string.

file_name = 'parameters.txt';
fid = fopen(file_name, 'r');

value = 'unfound';

while ~feof(fid)
    line = fgets(fid); %# read line by line
    A = strsplit(line, '\t');
    if strcmp(A{1}, name)
        value = strrep(A{2},sprintf('\n'),'');
        break;
    end
end

fclose(fid);


