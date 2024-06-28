clear;clc;
theta1min = -136; theta1max = 136;
theta2min = -85; theta2max = 97;
theta3min = -91; theta3max = 47;
theta4min = -141; theta4max = 182;
theta5min = -220; theta5max = 30;
theta6min = -360; theta6max = 360;
%
n = 3000;
x = zeros; y = zeros; z = zeros;

for i = 1:n

    theta1 = theta1min * (pi / 180) + (theta1max - theta1min) * (pi / 180) * rand;
    theta2 = theta2min * (pi / 180) + (theta2max - theta2min) * (pi / 180) * rand;
    theta3 = theta3min * (pi / 180) + (theta3max - theta3min) * (pi / 180) * rand;
    theta4 = theta4min * (pi / 180) + (theta4max - theta4min) * (pi / 180) * rand;
    theta5 = theta5min * (pi / 180) + (theta5max - theta5min) * (pi / 180) * rand;
    theta6 = theta6min * (pi / 180) + (theta6max - theta6min) * (pi / 180) * rand;

    Tws = MODtransmatrix(theta1, theta2, theta3, theta4, theta5, theta6)
    x(i) = Tws(1, 4);
    y(i) = Tws(2, 4);
    z(i) = Tws(3, 4);
end

figure('color', [1 1 1]);
plot3(x, y, z, 'b.', 'MarkerSize', 0.5)
hold on
xlabel('x÷·(millimeter)', 'color', 'k', 'fontsize', 15);
ylabel('y÷·(millimeter)', 'color', 'k', 'fontsize', 15);
zlabel('z÷·(millimeter)', 'color', 'k', 'fontsize', 15);
grid on
