% @file ��Simple_GeneticOptimization.m�� 
% @brief ��ͨ���Ŵ��Ż��㷨���f(x)=x*sin(10pi*x)+1�����ֵ��x����[-1,2]��
% @version 1.0 
% @author ��RyanZzzq��
% @date ��2023.7.6��

%% Ԥ����
clc
clear
close all

%% ������Ӧ�Ⱥ���
fitnessFunction =  'x  .*  sin(x .* 10 * pi) + 1'; %@(x) x.*sin(10*pi*x) + 1;
x_min = -1;
x_max = 2; %�Ա���ȡֵ����

%��ʼ������
populationSize = 100; %��Ⱥ��С
chromLength = 10; %���볤��
crossoverProbability = 0.8; %�������
mutationProbability = 0.05; %�������
maxGenerations = 400; %����������

%��ʼ����Ⱥ
Pop = zeros(populationSize,chromLength);  %N�����壬ÿ������ı��볤��ΪL����01����
Pop = round(rand([populationSize,chromLength]));

%% ����
%������ʼ��
fit_mean = [];%ƽ����Ӧ��
fit_opt = [];%������Ӧ��
iter = 1;%����������

%��ʼ����
for iter = 1:maxGenerations
   x = bin2dec(Pop(:,1:chromLength),x_min,x_max);
   fit = eval(fitnessFunction);  
    % ѡ��
   P_new = selection(Pop,fit);
    % ����
   P_new = crossover(P_new,crossoverProbability);
    % ����
   P_new = mutation(P_new,mutationProbability);
   
    %������Ⱥ
   Pop = P_new;
    %��������Ⱥ����Ӧ��
   x = bin2dec(Pop(:,1:chromLength),x_min,x_max);
   fit = eval(fitnessFunction);
   
   [opt,loc] = max(fit);%��¼������Ӧ�Ⱥ����Ÿ���
   fit_mean(iter) = mean(fit);  %��¼��Ӧ�Ⱦ�ֵ
   fit_opt(iter) = opt;  %��¼�����Ӧ��
  
    
%% ��ͼ����    
% ��ʼѡȡ�Ļ���λ��  
   if iter == 1
      pause(1)
      figure(1)
      cla
      fplot(fitnessFunction,[x_min,x_max]);
      hold on 
      plot(x,fit,'r*')
      title(['��������iter=',num2str(iter)])
   end
    %����λ�ñ仯��¼   
   if mod(iter,50) == 0
      pause(1)
      figure(1)
      cla
      fplot(fitnessFunction,[x_min,x_max]);
      hold on 
      plot(x,fit,'r*')
      title(['��������iter=',num2str(iter)])
   end
   iter = iter + 1;
end

% ������ս������f�����ֵ
fprintf('The Best X -->%5.6f\n',x(loc));
fprintf('The Best Y -->%5.6f\n',opt);