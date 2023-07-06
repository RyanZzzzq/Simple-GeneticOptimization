% @file （Simple_GeneticOptimization.m） 
% @brief （通过遗传优化算法求解f(x)=x*sin(10pi*x)+1的最大值，x属于[-1,2]）
% @version 1.0 
% @author （RyanZzzq）
% @date （2023.7.6）

%% 预处理
clc
clear
close all

%% 定义适应度函数
fitnessFunction =  'x  .*  sin(x .* 10 * pi) + 1'; %@(x) x.*sin(10*pi*x) + 1;
x_min = -1;
x_max = 2; %自变量取值区间

%初始化参数
populationSize = 100; %种群大小
chromLength = 10; %编码长度
crossoverProbability = 0.8; %交叉概率
mutationProbability = 0.05; %变异概率
maxGenerations = 400; %最大迭代次数

%初始化种群
Pop = zeros(populationSize,chromLength);  %N个个体，每个个体的编码长度为L，由01构成
Pop = round(rand([populationSize,chromLength]));

%% 迭代
%迭代初始化
fit_mean = [];%平均适应度
fit_opt = [];%最优适应度
iter = 1;%迭代计数器

%开始进化
for iter = 1:maxGenerations
   x = bin2dec(Pop(:,1:chromLength),x_min,x_max);
   fit = eval(fitnessFunction);  
    % 选择
   P_new = selection(Pop,fit);
    % 交叉
   P_new = crossover(P_new,crossoverProbability);
    % 变异
   P_new = mutation(P_new,mutationProbability);
   
    %更新种群
   Pop = P_new;
    %计算新种群的适应度
   x = bin2dec(Pop(:,1:chromLength),x_min,x_max);
   fit = eval(fitnessFunction);
   
   [opt,loc] = max(fit);%记录最优适应度和最优个体
   fit_mean(iter) = mean(fit);  %记录适应度均值
   fit_opt(iter) = opt;  %记录最佳适应度
  
    
%% 画图部分    
% 初始选取的基因位置  
   if iter == 1
      pause(1)
      figure(1)
      cla
      fplot(fitnessFunction,[x_min,x_max]);
      hold on 
      plot(x,fit,'r*')
      title(['迭代次数iter=',num2str(iter)])
   end
    %基因位置变化记录   
   if mod(iter,50) == 0
      pause(1)
      figure(1)
      cla
      fplot(fitnessFunction,[x_min,x_max]);
      hold on 
      plot(x,fit,'r*')
      title(['迭代次数iter=',num2str(iter)])
   end
   iter = iter + 1;
end

% 输出最终结果，即f的最大值
fprintf('The Best X -->%5.6f\n',x(loc));
fprintf('The Best Y -->%5.6f\n',opt);