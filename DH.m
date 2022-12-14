L1 = 40;
L2 = 104.6;
L3 = 104.6;
L4 = 91;
L(1) = Link('revolute','qlim',[0 pi],'d',L1,'a',0,'alpha',pi/2,'offset',0);
L(2) = Link('revolute','qlim',[0 pi],'d',0,'a',L2,'alpha',0,'offset',0);
L(3) = Link('revolute','qlim',[0 pi],'d',0,'a',L3,'alpha',0,'offset',0);
L(4) = Link('revolute','qlim',[0 pi],'d',0,'a',0,'alpha',pi/2,'offset',pi/2);

ROBOT = SerialLink(L,'name','Rob');
ROBOT.tool = transl(0,0,L4);
%% 
figure(1)
ROBOT.plot([0 0 0 0],'notiles','noname');

%% 
figure(2)
ROBOT.plot([0 pi/2 0 0],'notiles','noname');

%% 
figure(3)
ROBOT.plot([0 0 pi/4 -pi/4],'notiles','noname');
%% 
%Hallamos las MTH
syms q1 q2 q3 q4
H10 = trotz(q1)*transl(L1,0,0)*transl(0,0,0)*trotx(pi/2)
H21 = trotz(q2)*transl(0,0,0)*transl(L2,0,0)*trotx(0)
H32 = trotz(q3)*transl(0,0,0)*transl(L3,0,0)*trotx(0)
H43 = trotz(q4)*transl(0,0,0)*transl(0,0,0)*trotx(pi/2)
H40 = H10*H21*H32*H43

%% 
q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0;
MTH_TCP = subs(H40)


