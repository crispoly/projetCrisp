%=========================================================================%
%Base de donnée pour les instructions du contrôleur TMCM1633
%=========================================================================%
clear all
clc
%=========================================================================%
% Instruction
[value_inst, key_inst] = xlsread('BD.xlsx','Instruction') ;
instruction = containers.Map;
for i=1: length(value_inst)
keySet = {char(key_inst(i,2))'} ; 
valueSet = [double(value_inst(i))];
newMap = containers.Map(keySet,valueSet);
instruction = [instruction ; newMap];
end
inst_keys=instruction.keys;   %sort_nat sert à obtenir les valeurs dans le bon ordre
%=========================================================================%
% Type des instructions
for i=1:length(value_inst)
[value, key] = xlsread('BD.xlsx',char(inst_keys(i))) ;
typ = containers.Map;
for j=1: size(key,1)
keySet = char(key(j,2)) ; 
valueSet = [double(value(j,1))];
newMap = containers.Map(keySet,valueSet);
typ = [typ ; newMap];
end
type{i}=typ;
end
%=========================================================================%
% Valeurs min possibles selon les types
for i=1:length(value_inst)
[value, key] = xlsread('BD.xlsx',char(inst_keys(i))) ;
min = containers.Map;
for j=1: size(key,1)
keySet = char(key(j,2)) ; 
valueSet = [double(value(j,2))];
newMap = containers.Map(keySet,valueSet);
min = [min ; newMap];
end
valeur_min{i}=min;
end
%=========================================================================%
% Valeurs max possibles selon les types
for i=1:length(value_inst)
[value, key] = xlsread('BD.xlsx',char(inst_keys(i))) ;
max = containers.Map;
for j=1: size(key,1)
keySet = char(key(j,2)) ; 
valueSet = [double(value(j,3))];
newMap = containers.Map(keySet,valueSet);
max = [max ; newMap];
end
valeur_max{i}=max;
end
%=========================================================================%
%Bank
%0 a 255

%String
for i=1:256
    s{i} = num2str(i-1);
end

%Vecteur
for i=1:256
    v(i) = i-1;
end
%Valeure

for i=1:8
    bank{i} = containers.Map({'0'},0);
end

for i=9:10
    bank{i} = containers.Map({'0 - Bank 0', '2 - Bank 2'},[0 2]);
end

for i=11:12
    bank{i} = containers.Map({'2 - Bank 2'},2);
end

bank{13} = containers.Map({'0'},0);
bank{14} = containers.Map({'2 - output'},2);
bank{15} = containers.Map({'0 - digital','1 - analog','2 - output'},[0 1 2]);
bank{35} = containers.Map({'0 - Bank 0', '2 - Bank 2'},[0 2]);

for i=19:34
    bank{i} = containers.Map({'0'},0);
end

for i=36:39
    bank{i} = containers.Map({'0'},0);
end

for i=64:71
    bank{i} = containers.Map(s,v);
end

for i=128:139
    bank{i} = containers.Map({'0'},0);
end
%=========================================================================%
%Cas special de l'instruction 15
% Les types dependent de l'instruction ET de la valeur de bank
% gio{valeur de l'instruction}{bank value+1}
% {bank value +1} car un index 0 n'existe pas dans un cell{} ca commence a
% partir de 1

gio{15}{1} = containers.Map({'0 - IN_0', '1 - IN_1'},[0 1]);
gio{15}{2} = containers.Map({'0 - ADC_IN_0','1 - ADC_IN_1','2 - ADC_phase_A','3 - ADC_phase_B','4 - ADC_phase_C','5 - ADC_VSupply','6 - ADC_Temp'},[0 1 2 3 4 5 6]);
gio{15}{3} = containers.Map({'0 - OUT_0'},0);
%=========================================================================%

%Création d'une matrice contenant les containers map

save('data','bank','instruction','type','valeur_min','valeur_max','gio')

