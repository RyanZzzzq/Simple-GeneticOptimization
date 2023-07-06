% 二进制转十进制
function num = bin2dec(num_bin,n_min,n_max)
% num_bin:一串二进制数
% n_min，n_max：归一化的上下区间
% 二进制转化为十进制，再把十进制的数压缩到[n_min,n_max]区间上
    num_bin = fliplr(num_bin);%二进制串左右反转
    [m,n] = size(num_bin);%m个长度n的二进制串
    weight = 0:1:n-1;
    weight = ones(m,1) * weight;%[m,n]的权重矩阵，每一行都是0，1，2...n-1，2的多少次方
    num_dec = sum((num_bin .* 2.^weight)');  %每一分位成对应的权重求和  %转置是因为sum是列求和
    num = n_min + (n_max-n_min) * num_dec ./ (2^n - 1);
end