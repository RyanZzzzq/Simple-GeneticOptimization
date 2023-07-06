% ������תʮ����
function num = bin2dec(num_bin,n_min,n_max)
% num_bin:һ����������
% n_min��n_max����һ������������
% ������ת��Ϊʮ���ƣ��ٰ�ʮ���Ƶ���ѹ����[n_min,n_max]������
    num_bin = fliplr(num_bin);%�����ƴ����ҷ�ת
    [m,n] = size(num_bin);%m������n�Ķ����ƴ�
    weight = 0:1:n-1;
    weight = ones(m,1) * weight;%[m,n]��Ȩ�ؾ���ÿһ�ж���0��1��2...n-1��2�Ķ��ٴη�
    num_dec = sum((num_bin .* 2.^weight)');  %ÿһ��λ�ɶ�Ӧ��Ȩ�����  %ת������Ϊsum�������
    num = n_min + (n_max-n_min) * num_dec ./ (2^n - 1);
end