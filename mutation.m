% 变异操作
function P_new = mutation(P,pm)
% 根据变异概率，随机位点发生变异，0变1，1变0
% P：旧种群
% pm：变异概率
% P_new：新种群
    [m,n] = size(P);
    P_new = P;
    for i = 1:m
       if rand < pm %发生变异
           p_mutation = ceil(rand*n);   %变异的点位
           if P_new(i,p_mutation) == 0
              P_new(i,p_mutation) = 1;
           else
              P_new(i,p_mutation) = 0;  %对变异点的记忆值进行反转
           end
      end
    end
end