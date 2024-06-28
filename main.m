clear;clc;
syms theta1 theta2 theta3 theta4 theta5 theta6;
theta1 = 0; % 60度 180 / 3 = 60 后面依次类推 1.0
theta2 = 0; % 45  0.8
theta3 = 0; % 36  0.6
theta4 = 0; % 60  1.0
theta5 = 0; % 40  0.7
theta6 = 0; % 36  0.6

% % 定义机械臂DH参数，其中L=[theta d a alpha]
L1 = [theta1, 153.5, 0, 0];
L2 = [theta2 + -pi / 2, 0, 24, -pi / 2];
L3 = [theta3, 0, 160.72, 0];
L4 = [theta4, 220.50, 20, -pi / 2];
L5 = [theta5 + pi / 2, 0, 0, pi / 2];
L6 = [theta6, -45, 0, pi / 2];

T01 = fun_dirsolu_mdh(L1(1), L1(2), L1(3), L1(4));
T12 = fun_dirsolu_mdh(L2(1), L2(2), L2(3), L2(4));
T23 = fun_dirsolu_mdh(L3(1), L3(2), L3(3), L3(4));
T34 = fun_dirsolu_mdh(L4(1), L4(2), L4(3), L4(4));
T45 = fun_dirsolu_mdh(L5(1), L5(2), L5(3), L5(4));
T56 = fun_dirsolu_mdh(L6(1), L6(2), L6(3), L6(4));

T06 = T01 * T12 * T23 * T34 * T45 * T56;

% % 求解变换矩阵，T1赋值，round_matrix化简打印。
T1 = fun_round_matrix(subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {pi / 3, pi / 4, pi / 5, pi / 3, pi / 4.5, pi / 5}));
% T2 = fun_round_matrix(subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {0, 0, 0, 0, 0, 0}));

% % 求出八组逆解。
[S, Q] = fun_revsolu_Kuka6D(T1);
result = MODikine(T1);

% % % % % 求解工作空间，R赋值，dirsolu_6D_workspace.m绘制工作空间。
R = [-pi pi; - (13/18) * pi (2/18) * pi; (-10/18) * pi (14/18) * pi; -pi pi; -pi pi; -pi pi];
dirsolu_6D_workspace;
scatter3(qx, qy, qz)