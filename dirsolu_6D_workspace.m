%��Ҫʵ�֣��������˶�ѧ��⹤���ռ䡣
%ע�⣺(����ֱ�����У�)
%1���������N����lim_theta�Ƕȵ���ɢ��ֵ��Χ��rand(N,1)��ʾ�½�N��0~1���������1��ʾ1�У����1�ĳ�10��
%��10������ÿ�ж���N��������theta1��������Ϊ[-pi,pi]��ôΪ��ʹ����ɢ��lim_theta1Ҳ��[-pi,pi]֮��
%�������ֵΪ-pi+2*pi*rand(N,1)���ó�����X=[a,b]ʱ������ɢ��ΧX=a+(b-a)*rand(N,1)��

%2��forѭ����n��ʾ���Ƶ�ͼʱ��ĸ�����

%3��subs������syms������ֵ�����ĩ��{6}������ϵԭ��[0;0;0]��Ի�������{0}��λ�ã�����T06��4X4����
%�����{6}ԭ�������1����[0;0;0;1]��ʾ��ԭ��λ�á�
if exist('T06') && exist('R')
    point = 15000;
    lim_theta1 = R(1, 1) + (R(1, 2) - R(1, 1)) * rand(point, 1);
    lim_theta2 = R(2, 1) + (R(2, 2) - R(2, 1)) * rand(point, 1);
    lim_theta3 = R(3, 1) + (R(3, 2) - R(3, 1)) * rand(point, 1);
    lim_theta4 = R(4, 1) + (R(4, 2) - R(4, 1)) * rand(point, 1);
    lim_theta5 = R(5, 1) + (R(5, 2) - R(5, 1)) * rand(point, 1);
    lim_theta6 = R(6, 1) + (R(6, 2) - R(6, 1)) * rand(point, 1);

    parfor n = 1:1:point
        p = subs(T06, {theta1 theta2 theta3 theta4 theta5 theta6}, {lim_theta1(n), lim_theta2(n), ...
                                                                    lim_theta3(n), lim_theta4(n), lim_theta5(n), lim_theta6(n)}) * [0; 0; 0; 1];
        q(n, :) = p;
    end

    q = double(q);
    qx = q((1:point), 1);
    qy = q((1:point), 2);
    qz = q((1:point), 3);

else
    disp('---------ERROR----------')
end

% % %----------------------------------------------------------------------------------
