I=imread('pallete.jpg');
palleteSize = 3

%convert rgb to lab

cform=makecform('srgb2lab');
im=applycform(I, cform);
ab=double(im(:,:,2:3));
rows=size(ab,1);
cols=size(ab,2);
ab=reshape(ab,rows*cols,2); %flatten
[clusterIdx, clusterCenter] = kmeans(ab, palleteSize,'distance','sqEuclidean','Replicates',3); %kmeans
labels_=reshape(clusterIdx, rows,cols);
labels=repmat(labels_,[1,1,3]);
segmentedImages=cell(1,palleteSize);

for p=1:palleteSize
    color=I;
    color(labels~=p)=0;
    segmentedImages{p}=color;
    
end

dominantIndex=0;
domCount=0;
for p=1:palleteSize
    im=segmentedImages{p};
    figure
    imshow(im)
    redChannel=im(:,:,1);
    greenChannel=im(:,:,2);
    blueChannel=im(:,:,3);
    promCol(p,1)=mean(redChannel(labels_==p));
    promCol(p,2)=mean(greenChannel(labels_==p));
    promCol(p,3)=mean(blueChannel(labels_==p));
end

block=imresize(I,[150,150]);
promColors=[];
for p=1:palleteSize
    block(:,:,1)=uint8(promCol(p,1));
    block(:,:,2)=uint8(promCol(p,2));
    block(:,:,3)=uint8(promCol(p,3));
    figure
    imshow(block);
    promColors=[promColors; uint8(block)];
end
imshow(promColors);