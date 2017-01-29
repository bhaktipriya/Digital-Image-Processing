I = imread('cloud3.jpg');
col = I;
I = im2bw(I);
I = ~ I; 

aux = zeros(size(I));
maxr=1;
maxc=1;
for i = 1:size(I,1)
    for j = 1:size(I,2)
        if((i==1) || (j==1))
            aux(i,j) = I(i,j);
            continue;
        end
        if (I(i,j)==1)
            aux(i,j)= min([aux(i,j-1) aux(i-1,j) aux(i-1,j-1)])+1;
        end
        
    end
end

for i = 1:size(I,1)
    for j = 1:size(I,2)
        if(aux(i,j)>aux(maxr,maxc))
            maxr=i;
            maxc=j;
        end
    end
end

maxs=aux(maxr,maxc);
%out=zeros(size(I));
col(maxr-maxs+1:maxr,maxc-maxs+1:maxc,3)=ones(maxs);
imshow(col);
