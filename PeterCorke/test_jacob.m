RobotC06=SerialLink([0,    87,     71,  pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0, 369.5,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0;
                   0,   321,      0, -pi/2,  0,   0;
                   0,     0,      0,  pi/2,  0,   0],'name', 'Robot Crisp'); 

c= clock;  
RobotC06.jacobe([0, 0, 0, 0, 0, 0])
c= clock - c