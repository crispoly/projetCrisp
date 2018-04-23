function [ tranform ] = RPY( r,p,ya )
%[ tranform ] = RPY( r,p,ya )
%   PARAMÈTRE FONCTION
        % r:     roulis du bras
        % p:     pitch du bras
        % ya:    tanguage du bras
        
        % tranform: tableau contenant la transformation RPY noa
        
%     tranform=[cos(r).*cos(p), cos(r).*sin(p).*sin(ya)-sin(r).*cos(ya),cos(r).*sin(p).*cos(ya)+sin(r).*sin(ya),0;
%             sin(r).*cos(p),sin(r).*sin(p).*sin(ya)+cos(r).*cos(ya),sin(r).*sin(p).*cos(ya)-cos(r).*sin(ya),0;
%             -sin(p), cos(p).*sin(ya), cos(p).*cos(ya),0;
%             0,0,0,1];
    tranform.nx=cos(r).*cos(p);
    tranform.ox=cos(r).*sin(p).*sin(ya)-sin(r).*cos(ya);
    tranform.ax=cos(r).*sin(p).*cos(ya)+sin(r).*sin(ya);
    tranform.ny=sin(r).*cos(p);
    tranform.oy=sin(r).*sin(p).*sin(ya)+cos(r).*cos(ya);
    tranform.ay=sin(r).*sin(p).*cos(ya)-cos(r).*sin(ya);
    tranform.nz=-sin(p);
    tranform.oz=cos(p).*sin(ya);
    tranform.az=cos(p).*cos(ya);

    
end

