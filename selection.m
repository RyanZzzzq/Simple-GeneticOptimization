% ѡ���㷨
function P_new = selection(P,fit)
% ��������ѡ����ѡ����Ҫ���ƵĻ���
% P_new : ���µĻ�����
% P: �Ǿɻ�����
% fit: �Ǿͻ���������Ӧ����Ӧ��
[m,~] = size(P); %��Ⱥ��m������
p_fit = fit./sum(fit);  %����
F_fit = cumsum(p_fit);  %�ֲ�����
temp = sort(rand(1,m));    %�������m������
fit_p = 1;
new_p = 1;  %����ָ�룬һ��ָ����Ⱥ��һ��ָ�ɵ�
while new_p <= m  %��Ҫѭ��m�Σ����»���������
     if temp(new_p) < F_fit(fit_p)   %������������ĸ�����ֲ��������Ƚϣ��ó�Ҫѡ��Ļ���
         P_new(new_p,:) = P(fit_p,:);  %ѡ�����ɸ���
         new_p = new_p + 1;      %ָ���һ��Ѱ����һ��Ҫѡ���
     else
         fit_p = fit_p + 1;  %�ھ���Ⱥ�У�û��ѡ����һ���塣��һ����һ�������ж�
     end
end