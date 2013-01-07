
len=200;
x=zeros(1,len);
y=zeros(1,len);
diff=zeros(1,len);
z=zeros(1,len);

for i=1:len
    x(i)=data(i,1);
    y(i)=data(i,2);
    diff(i)=data(i,3);
    z(i)=i;
end

plot(z,x,'b-*',z,y,'r-*',z,diff,'g-*');
%plot(data,'DisplayName','data','YDataSource','data');
%grid
xlabel('对比样本序列');
ylabel('关联度值');
%title('Sine and Cosine Curves');
figure(gcf)


