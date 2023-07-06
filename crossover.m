% �������
function P_new = crossover(P,pc)
% P_new: ����Ⱥ
% P : ����Ⱥ
% pc : �������
    [m,n] = size(P);
    for i = 1:2:m-1
       if rand < pc  %��������
           p_cross = ceil(rand * n); %��������ĵ�λ������������һ��֮������л��򽻻�
           P_new(i,:) =  [P(i,1:p_cross - 1),P(i + 1,p_cross:n)];
           P_new(i+1,:) = [P(i + 1,1:p_cross - 1),P(i,p_cross:n)];%�������彻��������Ļ�������
       else
           P_new(i,:) = P(i,:);
           P_new(i + 1,:) = P(i + 1,:);
       end
    end
end