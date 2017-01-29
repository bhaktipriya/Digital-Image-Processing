function [ O ] = upsample( RI, upsample )
 %upsample Reduced imagee RI
 
 for i=1:size(RI,1)
    U(2*i-1,:)=RI(i,:);
    U(2*i,:)=RI(i,:);
 end
 
 for i=1:size(RI,2)
  O(:,2*i-1)= U(:,i);
  O(:,2*i)= U(:,i);
 end
 
 O = uint8(imgaussfilt(O,1));


end

