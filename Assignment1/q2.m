%backgroundImage=imread('background.jpg');
greenImage=imread('../Assignment3/soccer_1.png');
backgroundImage=zeros(size(greenImage));

backgroundImage=imresize(backgroundImage,[540,960]);
greenImage=imresize(greenImage,[540,960]);
hsv=rgb2hsv(greenImage);
hue =round(hsv(:,:,1)*360);
saturation=round(hsv(:,:,2)*100);
lightness=round(hsv(:,:,3)*100);
[y,x]=find(hue >60 & hue<=150 );
for i=1:size(x)
    if (saturation(y(i),x(i))>40 )
        greenImage(y(i),x(i),:)=backgroundImage(y(i),x(i),:);
    end
end
imshow(greenImage);