% �������
function P_new = mutation(P,pm)
% ���ݱ�����ʣ����λ�㷢�����죬0��1��1��0
% P������Ⱥ
% pm���������
% P_new������Ⱥ
    [m,n] = size(P);
    P_new = P;
    for i = 1:m
       if rand < pm %��������
           p_mutation = ceil(rand*n);   %����ĵ�λ
           if P_new(i,p_mutation) == 0
              P_new(i,p_mutation) = 1;
           else
              P_new(i,p_mutation) = 0;  %�Ա����ļ���ֵ���з�ת
           end
      end
    end
end