function datagram = SAP(port,slave,type,valeure)

%Type
%0:Set target position
%1:Set actual position
%2:Set target velocity
%4:Set max velocity
%6:Set max current
% .....
datagram = zeros(1,9)  ;
datagram = uint8(datagram) ;
n = int32(valeure) ; %Valeur!!

%Target addr,Instruction,Type,#motor tjrs 0
datagram(1:4) = uint8([slave,5,type,0]);

datagram(5)= uint8(bitand(bitshift(n,-24),255) );
datagram(6)= uint8(bitand(bitshift(n,-16),255) );
datagram(7)= uint8(bitand(bitshift(n,-8),255) );
datagram(8)= uint8(bitand(n,255) );
datagram(9)=uint8(bitand(sum(datagram(1:8)),255) );

%open com port for data transfer
fid = serial(port,'BaudRate',9600, 'DataBits', 8, 'Parity', 'none','StopBits', 1, 'FlowControl', 'none');
fopen (fid);

%send command
fwrite(fid,datagram);
pause(1);

%get answer
datagram = fread(fid, 9, 'uint8');

%close com port connection
fclose(fid);

end

