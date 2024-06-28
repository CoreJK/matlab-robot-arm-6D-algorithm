%% MOD-DH����
%�������˵�D-H����
%����ƫ��
d1 = 153.5;
d2 = 0;
d3 = 0;
d4 = 220.5;
d5 = 0;
d6 = -45;
%���˳���
a1 = 24;
a2 = 160.72;
a3 = 0;
a4 = 0;
a5 = 0;
a6 = 0;
%����Ť��
alpha1 = -pi / 2;
alpha2 = 0;
alpha3 = -pi / 2;
alpha4 = pi / 2;
alpha5 = pi / 2;
alpha6 = 0;
%����������ģ�ͣ����� MDH ���������ڸĽ���DH������
%       theta  d       alpha a        
L1 = Link([0 d1 a1 alpha1]);
L2 = Link([0 d2 a2 alpha2]);L2.offset = -pi / 2;
L3 = Link([0 d3 a3 alpha3]);
L4 = Link([0 d4 a4 alpha4]);
L5 = Link([0 d5 a5 alpha5]);L5.offset = pi / 2;
L6 = Link([0 d6 a6 alpha6]);
%���ƻ����˵Ĺؽڿռ�
L1.qlim = [(-136/180) * pi, (136/180) * pi];
L2.qlim = [(-85/180) * pi, (97/180) * pi];
L3.qlim = [(-91/180) * pi, (47/180) * pi];
L4.qlim = [(-141/180) * pi, (182/180) * pi];
L5.qlim = [(-220/180) * pi, (30/180) * pi];
L6.qlim = [(-360/180) * pi, (360/180) * pi];
%�������ˣ�������ȡ��Ϊmirobot
robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'Blinxrobot_dh_model');
robot.plot([0, 0, 0, 0, 0, 0]); %���������ģ�ͣ������������Ϊ���ʱ��theta��̬
robot.display(); %��ӡ��������D-H������
robot.teach; %չʾ������ģ��
hold on;
