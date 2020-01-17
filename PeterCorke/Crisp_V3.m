%% CRISP : Cinématique Directe
%
%
% clc; clear all; close all;
% 


                 %theta   d     a    alpha   rot   offset           
RobotC=SerialLink([0, 257.1,   78.2,  pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0, 395.2,   18.1, -pi/2,  0,   0;
                   0,     0,  -18.1,  pi/2,  0,   0;
                   0, 262.6,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0,    67,      0,     0,  0,   0],'name', 'Robot Crisp'); 

                 %theta   d     a    alpha   rot   offset           
RobotC=SerialLink([0, 257.1,   78.2,  pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0, 395.2,   18.1, -pi/2,  0,   0;
                   0,     0,  -18.1,  pi/2,  0,   0;
                   0, 262.6,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0],'name', 'Robot Crisp'); 

                 %theta   d     a    alpha   rot   offset           
RobotC06=SerialLink([0,    87,     71,  pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0, 369.5,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0,   321,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0],'name', 'Robot Crisp'); 
               
figure(1)
view(3) 
hold on
grid on
axis([-1000,1000,-1000,1000,-1000,1000])
fKine={};
pos={};
pos{1}=[0, pi/4, pi/2, pi/2, -pi/4, 0, 0];

fKine{1} = RobotC.fkine(pos{1});
RobotC.plot(pos{1})  

NOAP_target = fKine{1};
NOAP_target.t = [400, -350, -150];
qf = cine_inverse(RobotC06, NOAP_target, pos{1});

fKine{2} = RobotC.fkine(qf);

RobotC.plot(qf)  
%% Trace de trajectoire

 R = fKine{1};
 R.t = [300; -300; -200];
 Traj_xCercle{1,100} = []; Traj_qCercle{1,100} = [];
 Traj_xCercle{1} = R;

Traj_qCercle{1} =  cine_inverse(RobotC06,Traj_xCercle{1},pos{1});

% for t=2:200
%  R.t = [50*sin(t/10)+300; -330; 100*cos(t/10)-200];
%  Traj_xCercle{t} = R;
%  Traj_qCercle{t} = cine_inverse(RobotC06,Traj_xCercle{t},Traj_qCercle{t-1});
% end


% Traj_xLigne{1,100} = []; Traj_qLigne{1,100} = [];
% Traj_xLigne{1} = R;
% Traj_qLigne{1} =  cine_inverse(RobotC06,Traj_xLigne{1},pos{1});
% 
% for t=2:100
%  R.t = [332; 150*sin(t/10)-300; -174];
%  Traj_xLigne{t} = R;
%  Traj_qLigne{t} = cine_inverse(RobotC06,Traj_xLigne{t},Traj_qLigne{t-1});
% end
 
% for i=1:200
%  RobotC.plot(Traj_qCercle{i});
% end
% 
%  for i=1:100
%  RobotC.plot(Traj_qLigne{i});
%  end


hold off
%Traj = 
% Q=
% [x, NOAP] = cine_directe(pos{2});
% [qf, Q] = cine_inverse(NOAP, [0,0,0,0,0,0]);
% figure(3)
% view(3) 
% hold on
% grid on
% axis([-1000,1000,-1000,1000,-1000,1000])
% RobotC.plot([qf',0])








% fKine={};
% pos={};
% pos{1}=[0,0,0,0,0,0];
% fKine{1} = RobotC.fkine(pos{1});
% RobotC.plot([0,0,0,0,0,0])
% 
% pos{2}=[0, 0, 0, 0, -deg2rad(90), deg2rad(175)];
% fKine{2}=RobotC.fkine(pos{2});
% RobotC.plot(pos{2})
% 
% pos{3}=[deg2rad(90), 0, 0, 0, -deg2rad(90), deg2rad(175)];
% fKine{3}=RobotC.fkine(pos{3});
% RobotC.plot(pos{3})
% 
% pos{4}=[0, deg2rad(45), 0, 0, -deg2rad(90), deg2rad(175)];
% fKine{4}=RobotC.fkine(pos{4});
% RobotC.plot(pos{4})
% 
% pos{5}=[0, 0, -deg2rad(45), 0, 0, deg2rad(175)];
% fKine{5}=RobotC.fkine(pos{5});
% RobotC.plot(pos{5})
% 
% pos{6}=[deg2rad(10), deg2rad(10), -deg2rad(45), deg2rad(10), deg2rad(10), deg2rad(165)];
% fKine{6}=RobotC.fkine(pos{6});
% RobotC.plot(pos{6})
% 
% pos{7}=[deg2rad(20), deg2rad(20), -deg2rad(45), deg2rad(20), deg2rad(20), deg2rad(155)];
% fKine{7}=RobotC.fkine(pos{7});
% RobotC.plot(pos{7})
% 
% pos{8}=[deg2rad(30), deg2rad(30), -deg2rad(45), deg2rad(30), deg2rad(30), deg2rad(145)];
% fKine{8}=RobotC.fkine(pos{8});
% RobotC.plot(pos{8})
% 
% pos{9}=[deg2rad(40), deg2rad(40), -deg2rad(45), deg2rad(40), deg2rad(40), deg2rad(135)];
% fKine{9}=RobotC.fkine(pos{9});
% RobotC.plot(pos{9})
% 
% pos{10}=[deg2rad(50), deg2rad(50), -deg2rad(45), deg2rad(50), deg2rad(50), deg2rad(125)];
% fKine{10}=RobotC.fkine(pos{10});
% RobotC.plot(pos{10})
% 
% pos{11}=[deg2rad(60), deg2rad(60), -deg2rad(45), deg2rad(60), deg2rad(60), deg2rad(115)];
% fKine{11}=RobotC.fkine(pos{11});
% RobotC.plot(pos{11})
% 
% RobotC.plot(pos{1})
% angYPR={}; %Engeristrement des angle yaw-pitch-roll (xyz)
%  for i=1:11
%     RotXYZ=[fKine{i}.n,fKine{i}.o,fKine{i}.a];
%     Noap=[RotXYZ,fKine{i}.t;[0,0,0,1]];
%     
%     phi1=atan2(Noap(2,1),Noap(1,1));
%     theta1=atan2(-Noap(3,1),cos(phi1)*Noap(1,1)+sin(phi1)*Noap(2,1));
%     psi1=atan2(sin(phi1)*Noap(1,3)-cos(phi1)*Noap(2,3),-sin(phi1)*Noap(1,2)+cos(phi1)*Noap(2,2));
%     
%     phi2=atan2(Noap(1,2),Noap(1,1));
%     theta2=atan2(Noap(1,3),cos(phi2)*Noap(1,1)-sin(phi2)*Noap(1,2));
%     psi2=atan2(sin(phi2)*Noap(3,1)+cos(phi2)*Noap(3,2),sin(phi2)*Noap(2,1)+cos(phi2)*Noap(2,2));
%     
%     angYPR{i}={rad2deg([psi1,theta1,phi1;psi2,theta2,phi2])};
%      
%     
% %     fprintf("%.3f ",fKine{i}.n(1),fKine{i}.n(2),fKine{i}.n(3))
% %     fprintf("\n") 
% %     fprintf("%.3f ",fKine{i}.o(1),fKine{i}.o(2),fKine{i}.o(3))
% %     fprintf("\n")
% %     fprintf("%.4f ",fKine{i}.a(1),fKine{i}.a(2),fKine{i}.a(3))
% %     fprintf("\n") 
% %     fprintf("%.4f ",fKine{i}.t(1),fKine{i}.t(2),fKine{i}.t(3))
% %     fprintf("\n") 
%      
% end
%  
% fprintf("#   X      Y      Z       Yaw    Pitch    Roll\n")
% for i=1:size(angYPR,2)
%     fprintf("%d  ",i) 
%     if(i<10) fprintf(" ") 
%     end 
%     for j=1:3        
%         fprintf("%.2f ",abs(fKine{i}.t(j)))
%         if(abs(fKine{i}.t(j))<100) fprintf(" ")
%         if(abs(fKine{i}.t(j))<exp(10)*epsilon) fprintf(" ")
%         end
%         end
%     end
%     for j=1:3
%         fprintf("%.2f ",angYPR{1,i}{1,1}(1,j))
%         if(abs(angYPR{1,i}{1,1}(1,j))<100 && angYPR{1,i}{1,1}(1,j)>0) fprintf("  ")
%         end
%         if(abs(angYPR{1,i}{1,1}(1,j)<10 && angYPR{1,i}{1,1}(1,j)>0)) fprintf(" ")
%         end
%         if(abs(angYPR{1,i}{1,1}(1,j))<1) fprintf("  ")
%         end
%     end
%     fprintf("\n")
% end
% 
% % RobotF.plot([linspace(0,2*pi,100)' linspace(0,pi/4,100)' linspace(0,pi/2,100)' linspace(0,pi/4,100)' linspace(0,pi/4,100)' linspace(0,pi/4,100)';
% %    linspace(0,0,100)' linspace(pi/4,0,100)' linspace(pi/2,0,100)' linspace(pi/4,0,100)' linspace(pi/4,0,100)' linspace(pi/4,0,100)'],'delay',0.01)
% % Robot2.plot([linspace(0,2*pi,100)' linspace(0,pi/4,100)' linspace(0,pi/2,100)' linspace(0,pi/4,100)' linspace(0,pi/4,100)' linspace(0,pi/4,100)';
% %             linspace(0,0,100)' linspace(pi/4,0,100)' linspace(pi/2,0,100)' linspace(pi/4,0,100)' linspace(pi/4,0,100)' linspace(pi/4,0,100)'],'delay',0.01)

