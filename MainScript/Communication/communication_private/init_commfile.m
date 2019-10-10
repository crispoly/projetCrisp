function [  ] = init_commfile( )
%reset_commfile Initialisation du fichier de communication.
%   Les commandes sont d'abbord initialisées comme vides, puis les
%   commandes récurentes sont initialisées.

global map enabled_ddl;

fprintf('resetting commfile\n');

empty = uint8(zeros(1,9));

fields = fieldnames(map.data(1));
n = length(fields);
for i = 1:n
    field = fields(i);
    write_dg(map, field, empty, 1);
end

%Controlleur #1
if enabled_ddl(1)
    write_dg(map, "pos_1", get_sensor_dg("pos_1"), 1);
    write_dg(map, "ls_1_1", get_sensor_dg("ls_1_1"), 1);
    write_dg(map, "ls_1_2", get_sensor_dg("ls_1_1"), 1);
    % write_dg(map, "tl_1", get_sensor_dg("tl_1"), 1);
    write_dg(map, "t_1", get_sensor_dg("t_1"), 1);
end

%Controlleur #2
if enabled_ddl(2)
    write_dg(map, "pos_2", get_sensor_dg("pos_2"), 1);
    write_dg(map, "ls_2_1", get_sensor_dg("ls_2_1"), 1);
    write_dg(map, "ls_2_2", get_sensor_dg("ls_2_1"), 1);
    % write_dg(map, "tl_2", get_sensor_dg("tl_2"), 1);
    write_dg(map, "t_2", get_sensor_dg("t_2"), 1);
end

%Controlleur #3
if enabled_ddl(3)
    write_dg(map, "pos_3", get_sensor_dg("pos_3"), 1);
    write_dg(map, "ls_3_1", get_sensor_dg("ls_3_1"), 1);
    write_dg(map, "ls_3_2", get_sensor_dg("ls_3_1"), 1);
    % write_dg(map, "tl_3", get_sensor_dg("tl_3"), 1);
    write_dg(map, "t_3", get_sensor_dg("t_3"), 1);
end

%Controlleur #4
if enabled_ddl(4)
    write_dg(map, "pos_4", get_sensor_dg("pos_4"), 1);
    write_dg(map, "ls_4_1", get_sensor_dg("ls_4_1"), 1);
    write_dg(map, "ls_4_2", get_sensor_dg("ls_4_1"), 1);
    % write_dg(map, "tl_4", get_sensor_dg("tl_4"), 1);
    write_dg(map, "t_4", get_sensor_dg("t_4"), 1);
end



end


