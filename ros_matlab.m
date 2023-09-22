clear;
L(1) = Link([0, 127, 0, 0]);
L(2) = Link([-pi / 2, 0, 29.69, -pi / 2]);
L(3) = Link([0, 0, 108, 0]);
L(4) = Link([0, 168.98, 20, -pi / 2]);
L(5) = Link([pi / 2, 0, 0, pi / 2]);
L(6) = Link([0, -24.28, 0, pi / 2]);

robot = SerialLink([L(1), L(2), L(3), L(4), L(5), L(6)]);
robot.name = 'myrobot';
robot.teach;
