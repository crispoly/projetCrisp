clc; clear all; close all;

RobotC=SerialLink([0,    87,     71,  pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0, 369.5,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0,   321,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;],'name', 'Robot Crisp');
               
figure(1)
view(3) 
hold on
grid on
axis([-1000,1000,-1000,1000,-1000,1000])
fKine={};
pos={};
pos{1}=[0, 0, 0, 0, 0, 0];
fKine{1} = RobotC.fkine(pos{1});
RobotC.plot(pos{1})       
hold off 

pos{2}=[2, 0.1, 0, 0, 0, 0];
RobotC.plot(pos{2})

[q,err,exitflag]=RobotC.ikcon(RobotC.fkine(pos{2}),pos{1});
 RobotC.plot(q) 