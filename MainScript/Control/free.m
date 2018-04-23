function [ ] = free( )
%free Libère tout les ddl.
%   Detailed explanation goes here

global enabled_ddl;

t = [NaN, NaN, NaN, NaN, NaN, NaN];

for i = 1:6
   if enabled_ddl(i)
       t(i) = 0;
   end
end

set_t(t);

end

