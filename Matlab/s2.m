%�����ʽ����һ�У�����  �ڶ��У�S1+S2   �����У����
%�����s Ϊ�����dΪɸѡ֮��Ľ��  

%ָ��ÿ������m��ȼ���һ��ƽ��ֵ
thickness = 15; 
%����ɸѡ��ֵ
fliter_max = 6;
fliter_min = 3;
%���㾮��
num_log = data(length(data),1); 
%������������
num_data = length(data);  
%����Ԫ������
TOC=cell(num_log,1);



%��ÿ�ھ�װ��Ԫ������A
for i=1:num_data         %�����������ݼ�
    for j=1:num_log      %ÿ�ھ���ѭ��
        if(data(i,1)==j)
            TOC{j}(end+1)=data(i,2);
        end
    end
end

 %�������Ԫ������B,��ÿ�ھ����װ��Ԫ������
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


%����⾮���ݲ�����sampling��ÿ�ھ�����һ��
for i=1:num_log
    
    sampling(i)=Deep{i}(1,2)-Deep{i}(1,1);
    
end



 %����ƽ��ֵTOC_mean
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