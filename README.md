# 简单的遗传算法求解函数优化问题


## 问题叙述
- 以函数优化为例，求f(x)=x*sin(10π*x)+1.0的最大值，其中x∈[-1,2]。
- 假设适应度函数为f(x)，至于种群规模、选择算法、交叉概率、变异概率和计算精度等自行决定。


## 问题分析
为了解决给定的优化问题，即通过遗传优化算法求解函数的最大值，则按照遗传算法的解题步骤进行。
1. 首先，需要确定种群规模，即初始解的数量，以及交叉概率和变异概率来保持种群的多样性。
2. 其次，选择合适的选择算法来确定优秀个体。
3. 最后，使用适应度函数f(x)对种群中的个体进行评估，并根据选择、交叉和变异操作生成下一代种群。
通过迭代该过程，并记录每一代中的最优解，最终可以得到函数f(x)在给定区间上的最大值。


## 结果分析
- 在种群大小为100、编码长度为10、交叉概率为0.8、变异概率为0.05，迭代400次的条件下，程序运行结果和最优解如下：
![运行结果](https://github.com/RyanZzzzq/Simple-GeneticOptimization/assets/95045883/32f29637-1fbd-4900-8377-68ba4307b8f9)
![最优解](https://github.com/RyanZzzzq/Simple-GeneticOptimization/assets/95045883/de2b79a6-f110-47be-a834-0631e81305ac)
- 根据运行结果，最优解为(1.85,2.84)，符合根据图形观察获得的最大值大致位置，说明该遗传优化算法可以正确解出函数的最大值。
- 同时在迭代过程中可以清晰地观察到程序在不断向着最优解的方向接近，符合遗传算法的正确进行流程。


## 总结
1. 实验的迭代过程中，程序不断朝着最优解的方向接近，符合遗传算法的正确流程。
2. 通过选择、交叉和变异等操作，优秀个体逐渐被筛选出来并逐步优化。
3. 通过观察种群适应度的变化趋势和每一代中最优解的收敛情况，有助于了解算法的性能和进化过程。
