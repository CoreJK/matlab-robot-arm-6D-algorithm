%% MOD-DH参数
%定义连杆的D-H参数
%连杆偏移
d1 = 127;
d2 = 0;
d3 = 0;
d4 = 168.98;
d5 = 0;
d6 = -24.28;
%连杆长度
a1 = 0;
a2 = 29.69;
a3 = 108;
a4 = 20;
a5 = 0;
a6 = 0;
%连杆扭角
alpha1 = 0;
alpha2 = -pi / 2;
alpha3 = 0;
alpha4 = -pi / 2;
alpha5 = pi / 2;
alpha6 = pi / 2;
%建立机器人模型（基于 MDH 参数，属于改进型DH参数）
%       theta  d        a        alpha
L1 = Link([0 d1 a1 alpha1], 'modified');
L2 = Link([0 d2 a2 alpha2], 'modified');L2.offset = -pi / 2;
L3 = Link([0 d3 a3 alpha3], 'modified');
L4 = Link([0 d4 a4 alpha4], 'modified');
L5 = Link([0 d5 a5 alpha5], 'modified');L5.offset = pi / 2;
L6 = Link([0 d6 a6 alpha6], 'modified');
%限制机器人的关节空间
L1.qlim = [(-100/180) * pi, (100/180) * pi];
L2.qlim = [(-60/180) * pi, (90/180) * pi];
L3.qlim = [(-180/180) * pi, (50/180) * pi];
L4.qlim = [(-180/180) * pi, (180/180) * pi];
L5.qlim = [(-180/180) * pi, (40/180) * pi];
L6.qlim = [(-180/180) * pi, (180/180) * pi];
%连接连杆，机器人取名为mirobot
robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'Mirobot');
robot.plot([0, 0, 0, 0, 0, 0]); %输出机器人模型，后面的六个角为输出时的theta姿态
robot.display(); %打印出机器人D-H参数表
robot.teach; %展示机器人模型
hold on;
