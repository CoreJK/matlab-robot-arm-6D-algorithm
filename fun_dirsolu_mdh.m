% % %��Ҫʵ�֣��ռ�����任������DH�������i-1��i������˳��ı仯�ľ���
% % %ע�⣺2018�汾MATLABʹ��ʱ�����뽫pi����Ϊ�ַ�������syms pi����������(��ʱ�򵥶�����pi�ᱨ�����Բ��ӷֺŶ���pi)

% % %�������ֻ�Ƕ�����theta��仯����ʱ��
% % % syms theta;
% % % fun_dh(theta,0,0,pi/2)
% ���Ϊ��(4967757600021511*sin(theta))/81129638414606681695789005144064,������

% % %����pi����ú�
% % % syms theta;
% % % syms pi   %��ʱ���ӷֺţ���ֹ����
% % % fun_dh(theta,0,0,pi/2)
% ���Ϊ��[ cos(theta), -sin(theta),  0, 0]
% % % % % [          0,           0, -1, 0]
% % % % % [ sin(theta),  cos(theta),  0, 0]
% % % % % [          0,           0,  0, 1]
% % %----------------------------------------------------------------------------------

function T = fun_dirsolu_mdh(theta, d, a, alpha)
    T = fun_dirsolu_trotx(alpha) * fun_dirsolu_transl(a, 0, 0) * fun_dirsolu_trotz(theta) * fun_dirsolu_transl(0, 0, d);
end
