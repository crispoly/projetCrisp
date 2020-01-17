%%
clc; clear all; close all;

RobotF=SerialLink([0, 0.087,  0.071,   pi/2,  0,    0;
                   0,     0,      0,   pi/2,  0,    pi/2;
                   0,0.3695,      0,  -pi/2,  0,    0;
                   0,     0,      0,   pi/2,  0,    0;
                   0, 0.321,      0,  -pi/2,  0,    0;
                   0,     0,      0,   pi/2,   0,    0;  % fixe
                   0,0.0675,      0,      0,  0,   0;
                   ],'name', 'Robot Crisp'); 

view(3) 
hold on
grid on
axis([-1,1,-1,1,-1,1])
fKine={};
pos={};
pos{1}=[0,0,0,0,0,0,0];
fKine{1} = RobotF.fkine(pos{1});
RobotF.plot(pos{1})

RobotF.plot([linspace(0,2*pi,100)' linspace(0,pi/4,100)' linspace(0,pi/2,100)' linspace(0,pi/4,100)' linspace(0,pi/4,100)' linspace(0,pi/4,100)' linspace(0,0,100)';
           linspace(0,0,100)' linspace(pi/4,0,100)' linspace(pi/2,0,100)' linspace(pi/4,0,100)' linspace(pi/4,0,100)' linspace(pi/4,0,100)' linspace(0,0,100)';
           ],'delay',0.01)
