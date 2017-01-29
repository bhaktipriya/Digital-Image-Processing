function [ thresh ] = globalthresholding( I )
prev=1;
thresh=128;
h=imhist(I);
m=zeros(256,1);

for i = 1:256
    m(i)=(i-1)*h(i);
end
while ((abs(prev-thresh)>1) && (thresh<=255))
    prev=thresh;
    disp(thresh);
    t=uint8(thresh);
    m1=sum(m(1:t))/(sum(h(1:t)));
    t1=t+1;
    m2=sum(m(t1:255))/(sum(h(t1:255)));
    thresh=(m1+m2)/2;   
    disp(thresh);    
end

thresh=thresh/255;
end