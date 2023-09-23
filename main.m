clear;clc;
syms theta1 theta2 theta3 theta4 theta5 theta6;

% % �����е��DH����������L=[theta d a alpha]
L1 = [theta1, 127, 0, 0];
L2 = [theta2 + -pi / 2, 0, 29.69, -pi / 2];
L3 = [theta3, 0, 108, 0];
L4 = [theta4, 168.98, 20, -pi / 2];
L5 = [theta5 + pi / 2, 0, 0, pi / 2];
L6 = [theta6, -24.28, 0, pi / 2];

T01 = fun_dirsolu_mdh(L1(1), L1(2), L1(3), L1(4));
T12 = fun_dirsolu_mdh(L2(1), L2(2), L2(3), L2(4));
T23 = fun_dirsolu_mdh(L3(1), L3(2), L3(3), L3(4));
T34 = fun_dirsolu_mdh(L4(1), L4(2), L4(3), L4(4));
T45 = fun_dirsolu_mdh(L5(1), L5(2), L5(3), L5(4));
T56 = fun_dirsolu_mdh(L6(1), L6(2), L6(3), L6(4));

T06 = T01 * T12 * T23 * T34 * T45 * T56;

% % ���任����T1��ֵ��round_matrix�����ӡ��
% T1 = fun_round_matrix(subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {1.2, 0.3, 1, 0.2, 1.5, 0.8}));
T2 = fun_round_matrix(subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {0, 0, 0, 0, 0, 0}));

% % ���������⡣
[S, Q] = fun_revsolu_Kuka6D(T2);

% % % % % ��⹤���ռ䣬R��ֵ��dirsolu_6D_workspace.m���ƹ����ռ䡣
% R = [-pi pi; - (13/18) * pi (2/18) * pi; (-10/18) * pi (14/18) * pi; -pi pi; -pi pi; -pi pi];
% dirsolu_6D_workspace;
% scatter3(qx, qy, qz)