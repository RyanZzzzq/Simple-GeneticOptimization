% 交叉操作
function P_new = crossover(P,pc)
% P_new: 新种群
% P : 旧种群
% pc : 交叉概率
    [m,n] = size(P);
    for i = 1:2:m-1
       if rand < pc  %发生交叉
           p_cross = ceil(rand * n); %发生交叉的点位，两个个体这一点之后的所有基因交换
           P_new(i,:) =  [P(i,1:p_cross - 1),P(i + 1,p_cross:n)];
           P_new(i+1,:) = [P(i + 1,1:p_cross - 1),P(i,p_cross:n)];%两个个体交换交叉点后的基因序列
       else
           P_new(i,:) = P(i,:);
           P_new(i + 1,:) = P(i + 1,:);
       end
    end
end