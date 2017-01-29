I = imread('bottles.tif');
G = I;
C = im2bw(I, 0.7);
I = im2bw(I,0.1);
BW = edge(I ,'canny');
[H,T,R] = hough(BW,'Rhoresolution',0.5,'Theta',[30:60,-60:-30]);

P = houghpeaks(H,10);
x = T(P(:,2));
y = R(P(:,1));

lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
% figure,imshow(G),hold on
%figure,imshow(C),hold on
max_len=0;
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    %plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
     %plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
     %plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
 
end

mpx = (xy(1,2)+xy(2,2))/2;
%Get horizontal line
%plot([1,500],[mpx,mpx],'LineWidth',2,'Color','yellow');


%Get vertical lines
[H,T,R] = hough(BW,'Rhoresolution',0.5,'Theta',0);

P = houghpeaks(H,10);
x = T(P(:,2));
y = R(P(:,1));
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
%figure,imshow(G),hold on
%figure,imshow(C),hold on
max_len=0;
cols=[];
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    %disp(lines(k).point2);
    % plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%     
%      plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%      plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    xs = xy(1,1);
    r=mpx;
    c=xs;
    cols=[cols, c];
    %I(r-5:r+5, c-5:c+5)=zeros(11,11);

end

cols=sort(cols);
cols=[1 cols size(I,2)];

for k = 2:size(cols,2)
    disp(cols(k)-cols(k-1));
    if(((cols(k)-cols(k-1))>50))
        c = round((cols(k-1)+cols(k))/2);
        r=mpx;
        %C(r-5:r+5, c-5:c+5)=zeros(11,11);
        if(C(r+50,c)==C(r,c))
            disp('haha');
            I(r-5:r+5, c-5:c+5)=zeros(11,11);
        end
    end
end
figure,imshow(I);
