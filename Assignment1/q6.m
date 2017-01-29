I=imread('maze1.png');
O=I;
n=16;
blockSize=36;
front=1;
rear=2;
start=241;
queue(front)=start;

rows=size(I,1);
cols=size(I,2);
R(1)=255;
R(2)=0;
R(3)=0;
ct=1;
row=1;
col=1;
for i=1:16
	for j=1:16
		map(i,j)=ct;
		visited(ct)=0;
        ct=ct+1;
    end
end

target=[120 121 136 137];
adj=zeros(256,256);

for i=1:16
    for j=1:16
	 x=(i-1)*blockSize+blockSize/2;
     y=(j-1)*blockSize+blockSize/2;
     x=x+1;
     x=round(x);
	 y=round(y);
    %fprintf('top=%d i=%d j=%d\n',top,i,j);
 
	xd=x+blockSize;
	yr=y+blockSize;

    xn=xd;
    yn=y;
    in=i+1;
    jn=j;
    
	if((xn<=rows)&&(xn>0)&&(yn>0)&&(yn<=cols))
		if((in>0)&&(in<=16)&&(jn>0)&&(jn<=16))
            mpx=round((xn+x)/2);
		    mpy=round((yn+y)/2);
		    fl=0;
		    for k=-5+mpx:mpx+5
			    if((k<=rows)&&(k>0))
				    
					if((I(k,mpy,1)==R(1))&&(I(k,mpy,2)==R(2))&&(I(k,mpy,3)==R(3)))
						    fl=1;
				    end
			    end
		    end
		    if(fl==0)
                
               %fprintf('i=%d j=%d,in=%d jn=%d \n',i,j,in,jn);
 
				adj(map(in,jn),map(i,j))=1;
				adj(map(i,j),map(in,jn))=1;
			end
		end
	end

	
    xn=x;
    yn=yr;
    in=i;
    jn=j+1;
	if((xn<=rows)&&(xn>0)&&(yn>0)&&(yn<=cols))
		if((in>0)&&(in<=16)&&(jn>0)&&(jn<=16))
            mpx=round((xn+x)/2);
		    mpy=round((yn+y)/2);
		    fl=0;
		    for k=mpy-5:mpy+5
			    if((k<=cols)&&(k>0))
					if((I(mpx,k,1)==R(1))&&(I(mpx,k,2)==R(2))&&(I(mpx,k,3)==R(3)))
							    fl=1;
				    end
                    
			    end
		    end
		    if(fl==0)
                adj(map(i,j),map(in,jn))=1;
				adj(map(in,jn),map(i,j))=1;
		    end
	    end
    end

end
end
visited(start)=-1;

while(front<=rear)
    top=queue(front);
    front=front+1;
    if((top==target(1))||(top==target(2))||(top==target(3))||(top==target(4)))
		des=top;
        break;
    end
    %fprintf('top=====%d\n',top);
    for nei=1:256
        if(adj(top,nei)==1)
            if(visited(nei)==0)
                queue(rear)=nei;
                visited(nei)=top;
                rear=rear+1;
            end
        end
    end    
end

prev=des;
path=[];
while prev~=start
    %fprintf('prev=%d\n',prev);
 
    path=[path prev];
    prev=visited(prev);
end


for t=1:size(path,2)
    top=t;       
    i=floor(path(t)/16)+1;
	j=mod(path(t),16);
    if(j==0)
        j=16;
    end
	%disp(top);
	%disp(i);
	%disp(j);
	x=(i-1)*blockSize+(blockSize/2);
	y=(j-1)*blockSize+(blockSize/2);
	x=round(x);
	y=round(y);

    %fprintf('top=%d i=%d j=%d\n',top,i,j);
    for p=x-5:x+5
		for q=y-5:y+5
			O(p,q,1)=87;
			O(p,q,2)=24;
			O(p,q,3)=65;
		end
	end

end
imshow(O);


