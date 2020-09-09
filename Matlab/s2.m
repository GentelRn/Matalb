%输入格式：第一列：井号  第二列：S1+S2   第三列：深度
%输出：s 为结果，d为筛选之后的结果  

%指定每隔多少m厚度计算一次平均值
thickness = 15; 
%输入筛选的值
fliter_max = 6;
fliter_min = 3;
%计算井数
num_log = data(length(data),1); 
%计算总数据量
num_data = length(data);  
%创建元胞数组
TOC=cell(num_log,1);



%将每口井装进元胞数组A
for i=1:num_data         %遍历整个数据集
    for j=1:num_log      %每口井做循环
        if(data(i,1)==j)
            TOC{j}(end+1)=data(i,2);
        end
    end
end

 %创建深度元胞数组B,将每口井深度装进元胞数组
y(:,1)=data(:,1);
y(:,2)=data(:,3);
Deep = cell(num_log,1)  

for i=1:num_data 
    
    for j=1:num_log
        
        if(y(i,1)==j)
            
            Deep{j}(end+1)=y(i,2);
            
        end
        
    end
    
end


%计算测井数据采样率sampling，每口井计算一次
for i=1:num_log
    
    sampling(i)=Deep{i}(1,2)-Deep{i}(1,1);
    
end



 %计算平均值TOC_mean
for i=1:num_log            
    l(i)=length(TOC{i});   
    h(i)=ceil(thickness/sampling(i));
    x2(i)=ceil(l(i)/h(i))-1;
    
    for j=1:x2(i)
        TOC_mean(j,i)=mean(TOC{i}((j-1)*h(i)+1:j*h(i)));
    end
    
   TOC_mean(j+1,i)=mean(TOC{i}(j*h(i)+1:end));
   
end




for j=1:num_log
     k=1;
    for i=1:size(TOC_mean,1)
        if(TOC_mean(i,j)<fliter_max & TOC_mean(i,j)>fliter_min)
            fliter_result(k,j)=TOC_mean(i,j);
            k=k+1;
        end
    end
end