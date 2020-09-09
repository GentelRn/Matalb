clc;
clear;

%读取数据
Data = xlsread('Data.xlsx',1)

Data(isnan(x)==1) = 0;

[row,col] = size(Data)



for i = 1:col/2
    
    data = Data(:,2*i-1:2*i);
    
    [micro,little,mid,big,V_micro,V_little,V_mid,V_big] = RC(data);
    
    V(1,:) = [V_micro,V_little,V_mid,V_big];
    
end

%聚类分析
[Idx,C,sumD,D]=Kmeans(V,4,'dist','sqEuclidean','Replicates',4)