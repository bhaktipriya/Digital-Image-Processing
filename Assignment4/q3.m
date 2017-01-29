I=imread('tic-tac-toe4.jpg');
I=im2bw(I);
I=~I;
[h,w]=size(I);
divc=w/5;
divr=h/5;
% remove largest connected component to remove grid
con=bwconncomp(I);
nump=cellfun(@numel,con.PixelIdxList);
[big,idx]=max(nump);
I(con.PixelIdxList{idx})=0;

imshow(I);
% Assume image is divided into 5 rows 5 cols 
% such that rows/cols 2 3 4 are occupied by grid and rest black
centroids=regionprops(I,'centroid');
eu=regionprops(I,'EulerNumber');
grid=zeros(3);
for i =1:length(centroids)
    cent=(centroids(i).Centroid);
    r=round(cent(2)/divr);
    c=round(cent(1)/divc);
    if(c>3)c=c-1;end
    e=eu(i).EulerNumber;
    grid(r,c)=2*e-1;
    fprintf( 'i= %d, (%d, %d) %d\n', i,r,c,e );
%     if(cent(1)/divc
end
%check symbol in every grid and represent it in 3x3 matrix
% predict winner

colsum=sum(grid,1);
rowsum=sum(grid,2);
diag1sum=trace(grid);
diag2sum=trace(grid');

p=max([colsum, rowsum', diag1sum, diag2sum]);
n=min([colsum, rowsum', diag1sum, diag2sum]);
if(p==3)
    disp('Winner is X');
elseif(n==-3)
    disp('Winner is O');
    
else
    disp('Draw');
end

