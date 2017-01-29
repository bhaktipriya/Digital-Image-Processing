function [ thresh ] = otsu( I )
h=imhist(I)/numel(I);
sigmabest=0;
mg=mean(mean(I));
for k = 1:255
    sigmab=0;
    p1=0;
    p2=0;
    m1=0;
    m2=0;
    for i =1:255
        if(i<=k)
        p1=p1+h(i);
        m1=m1+(i-1)*h(i);
        else
        p2=p2+h(i);
        m2=m2+(i-1)*h(i);
        end
    end
    m1=m1/p1;
    m2=m2/p2;
    sigmab=p1*((m1-mg)^2)+p2*((m2-mg)^2);
    if(sigmab>sigmabest)
        sigmabest=sigmab;
        thresh=k;
    end
end
thresh=thresh/255;
end

