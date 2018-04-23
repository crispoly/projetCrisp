function [ m ] = get_memmapfile( )
%get_memmapfile Fonction qui retourne un memmapfile object, m tel qu'utilis�
%   dans le CommBot.

fprintf('getting memmapfile\n');

filename = 'Communication/commands.dat';
command_size = [2,10];
format = {'uint8', command_size, 'pos_1';...
          'uint8', command_size, 'pos_2';...
          'uint8', command_size, 'pos_3';...
          'uint8', command_size, 'pos_4';...
          'uint8', command_size, 'pos_5';...
          'uint8', command_size, 'pos_6';...
          'uint8', command_size, 'ls_1_1';...
          'uint8', command_size, 'ls_1_2';...
          'uint8', command_size, 'ls_2_1';...
          'uint8', command_size, 'ls_2_2';...
          'uint8', command_size, 'ls_3_1';...
          'uint8', command_size, 'ls_3_2';...
          'uint8', command_size, 'ls_4_1';...
          'uint8', command_size, 'ls_4_2';...
          'uint8', command_size, 'ls_5_1';...
          'uint8', command_size, 'ls_5_2';...
          'uint8', command_size, 'ls_6_1';...
          'uint8', command_size, 'ls_6_2';...
          'uint8', command_size, 'tl_1';...
          'uint8', command_size, 'tl_2';...
          'uint8', command_size, 'tl_3';...
          'uint8', command_size, 'tl_4';...
          'uint8', command_size, 'tl_5';...
          'uint8', command_size, 'tl_6';...
          'uint8', command_size, 't_1';...
          'uint8', command_size, 't_2';...
          'uint8', command_size, 't_3';...
          'uint8', command_size, 't_4';...
          'uint8', command_size, 't_5';...
          'uint8', command_size, 't_6';...
          'uint8', command_size, 'c_1';...
          'uint8', command_size, 'c_2';...
          'uint8', command_size, 'c_3';...
          'uint8', command_size, 'c_4';...
          'uint8', command_size, 'c_5';...
          'uint8', command_size, 'c_6';...
          'uint8', command_size, 'free'};
          
          
% Create the communications file if it is not already there.
if ~exist(filename, 'file')
    [f, msg] = fopen(filename, 'wb');
    if f ~= -1
        patch = zeros(size(format,1)*length(command_size));
        fwrite(f, patch, 'uint8');
        fclose(f);
    else
        error('MATLAB:demo:answer:cannotOpenFile', ...
              'Cannot open file "%s": %s.', filename, msg);
    end
end

% Memory map the file.
m = memmapfile(filename, 'Writable', true, 'Format', format);


end

