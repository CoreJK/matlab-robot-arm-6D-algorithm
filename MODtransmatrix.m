function [T06] = MODtransmatrix(theta1, theta2, theta3, theta4, theta5, theta6)
    %机械臂正运动学算法
    %连杆偏移
    d1 = 153.50;
    d2 = 0;
    d3 = 0;
    d4 = 220.50;
    d5 = 0;
    d6 = -45;

    %连杆长度
    a1 = 0;
    a2 = 24;
    a3 = 160.72;
    a4 = 0;
    a5 = 0;
    a6 = 0;

    %连杆扭角
    alpha1 = 0;
    alpha2 = -pi / 2;
    alpha3 = 0;
    alpha4 = -pi / 2;
    alpha5 = pi / 2;
    alpha6 = pi / 2;

    % 参数矩阵取名为MDH
    MDH = [theta1 d1 a1 alpha1;
           theta2 - pi / 2 d2 a2 alpha2;
           theta3 d3 a3 alpha3;
           theta4 d4 a4 alpha4;
           theta5 + pi / 2 d5 a5 alpha5;
           theta6 d6 a6 alpha6];

    T01 = [cos(MDH(1, 1)) -sin(MDH(1, 1)) 0 MDH(1, 3);
           sin(MDH(1, 1)) * cos(MDH(1, 4)) cos(MDH(1, 1)) * cos(MDH(1, 4)) -sin(MDH(1, 4)) -sin(MDH(1, 4)) * MDH(1, 2);
           sin(MDH(1, 1)) * sin(MDH(1, 4)) cos(MDH(1, 1)) * sin(MDH(1, 4)) cos(MDH(1, 4)) cos(MDH(1, 4)) * MDH(1, 2);
           0 0 0 1];
    T12 = [cos(MDH(2, 1)) -sin(MDH(2, 1)) 0 MDH(2, 3);
           sin(MDH(2, 1)) * cos(MDH(2, 4)) cos(MDH(2, 1)) * cos(MDH(2, 4)) -sin(MDH(2, 4)) -sin(MDH(2, 4)) * MDH(2, 2);
           sin(MDH(2, 1)) * sin(MDH(2, 4)) cos(MDH(2, 1)) * sin(MDH(2, 4)) cos(MDH(2, 4)) cos(MDH(2, 4)) * MDH(2, 2);
           0 0 0 1];
    T23 = [cos(MDH(3, 1)) -sin(MDH(3, 1)) 0 MDH(3, 3);
           sin(MDH(3, 1)) * cos(MDH(3, 4)) cos(MDH(3, 1)) * cos(MDH(3, 4)) -sin(MDH(3, 4)) -sin(MDH(3, 4)) * MDH(3, 2);
           sin(MDH(3, 1)) * sin(MDH(3, 4)) cos(MDH(3, 1)) * sin(MDH(3, 4)) cos(MDH(3, 4)) cos(MDH(3, 4)) * MDH(3, 2);
           0 0 0 1];
    T34 = [cos(MDH(4, 1)) -sin(MDH(4, 1)) 0 MDH(4, 3);
           sin(MDH(4, 1)) * cos(MDH(4, 4)) cos(MDH(4, 1)) * cos(MDH(4, 4)) -sin(MDH(4, 4)) -sin(MDH(4, 4)) * MDH(4, 2);
           sin(MDH(4, 1)) * sin(MDH(4, 4)) cos(MDH(4, 1)) * sin(MDH(4, 4)) cos(MDH(4, 4)) cos(MDH(4, 4)) * MDH(4, 2);
           0 0 0 1];
    T45 = [cos(MDH(5, 1)) -sin(MDH(5, 1)) 0 MDH(5, 3);
           sin(MDH(5, 1)) * cos(MDH(5, 4)) cos(MDH(5, 1)) * cos(MDH(5, 4)) -sin(MDH(5, 4)) -sin(MDH(5, 4)) * MDH(5, 2);
           sin(MDH(5, 1)) * sin(MDH(5, 4)) cos(MDH(5, 1)) * sin(MDH(5, 4)) cos(MDH(5, 4)) cos(MDH(5, 4)) * MDH(5, 2);
           0 0 0 1];
    T56 = [cos(MDH(6, 1)) -sin(MDH(6, 1)) 0 MDH(6, 3);
           sin(MDH(6, 1)) * cos(MDH(6, 4)) cos(MDH(6, 1)) * cos(MDH(6, 4)) -sin(MDH(6, 4)) -sin(MDH(6, 4)) * MDH(6, 2);
           sin(MDH(6, 1)) * sin(MDH(6, 4)) cos(MDH(6, 1)) * sin(MDH(6, 4)) cos(MDH(6, 4)) cos(MDH(6, 4)) * MDH(6, 2);
           0 0 0 1];

    T06 = T01 * T12 * T23 * T34 * T45 * T56;
end
