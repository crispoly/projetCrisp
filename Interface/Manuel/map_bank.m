%% 0 a 255

%String
for i=1:256
    s{i} = num2str(i-1);
end


%Vecteur
for i=1:256
    v(i) = i-1;
end
%% Valeure

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

