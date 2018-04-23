function [ ] = init_moteurs( )
%init_moteurs Initialise les variables globals des controlleurs
%   Detailed explanation goes here

global enabled_ddl;

if enabled_ddl(1)
    init_moteur1();
end

if enabled_ddl(1)
    init_moteur2();
end

if enabled_ddl(1)
    init_moteur3();
end

if enabled_ddl(1)
    init_moteur4();
end

end

