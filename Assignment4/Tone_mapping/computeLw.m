function [ lw ] = computeLw( L )
lw=0;
s=0;
delta=0.000001;
n=(size(L,1)*size(L,2));
% for i = 1:size(L,1)
%     for j = 1:size(L,2)
% %       disp('hahaaa');
% %       disp(L(i,j));
%       s=s+log(double(delta+L(i,j)));
%       n=n+1;
%     end
% end
lw=mean(mean(log(delta+L)));
lw=exp(lw);
%lw=(lw/n);
end

