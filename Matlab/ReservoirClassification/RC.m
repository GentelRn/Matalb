function[micro,little,mid,big,V_micro,V_little,V_mid,V_big] = RC(data,r1,r2,r3)

if (nargin==1)
       r1 = 15
       r2 = 100
       r3 = 750
end

%data为处理的压汞数据，第一列为孔径，第二列为孔体积增量
%设置孔隙分级参数，微孔r1,小孔r2，中孔r3



%建立分级矩阵
micro=[]
little = []
mid=[]
big=[]

%读取数据大小

[data_row,data_col] = size(data)

%按照孔径分级参数进行区分

for i=1:data_row

    if data(i,1) <= r1

        micro(end+1,1:2) = data(i,1:2)

    elseif r1 < data(i,1) & data(i,1) <= r2

        little(end+1,1:2) = data(i,1:2)

    elseif r2 < data(i,1) & data(i,1) <=r3

        mid(end+1,1:2) = data(i,1:2)

    else
        big(end+1,1:2) = data(i,1:2)

    end
end

%求取各区间孔隙体积百分比
V_micro = sum(micro(:,2))/sum(data(:,2))

V_little = sum(little(:,2))/sum(data(:,2))

V_mid = sum(mid(:,2))/sum(data(:,2))

V_big = sum(big(:,2))/sum(data(:,2))

end