function [ ] = write_parameter( name, value )
%write_parameter Fonction pour �crire un param�tre situ� dans le fichier texte
%   �parameters.txt�
%   Les valeurs pass� doivent �tre des strings.

file_name = 'parameters.txt';
fin = fopen(file_name,'r');
fout = fopen('temp.txt','wt');

while ~feof(fin)
    line = fgetl(fin);
    A = strsplit(line, '\t');
    if strcmp(A{1}, name)
        A{2} = value;
        line = strjoin(A, '\t');
    end
    fprintf(fout,'%s\n',line);
    disp(line)
end
fclose(fin);
fclose(fout);
movefile('temp.txt',file_name);
