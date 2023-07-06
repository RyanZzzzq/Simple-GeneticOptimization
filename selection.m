% 选择算法
function P_new = selection(P,fit)
% 采用轮盘选择法来选择需要复制的基因
% P_new : 是新的基因组
% P: 是旧基因组
% fit: 是就基因组所对应的适应度
[m,~] = size(P); %种群中m个个体
p_fit = fit./sum(fit);  %概率
F_fit = cumsum(p_fit);  %分布函数
temp = sort(rand(1,m));    %随机生产m个概率
fit_p = 1;
new_p = 1;  %两个指针，一个指新种群，一个指旧的
while new_p <= m  %需要循环m次，把新基因组填满
     if temp(new_p) < F_fit(fit_p)   %根据随机参数的概率与分布函数作比较，得出要选择的基因
         P_new(new_p,:) = P(fit_p,:);  %选择后完成复制
         new_p = new_p + 1;      %指针加一，寻找下一个要选择的
     else
         fit_p = fit_p + 1;  %在旧种群中，没有选中这一个体。加一对下一个进行判断
     end
end