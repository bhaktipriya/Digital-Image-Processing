function [ N ] = transform( I, T )
dim = size(I);
TI = inv(T);
w = T(3,3);
ul = [1; 1; 1];
ur = [0; dim(2); 1];
ll = [dim(1);1;1 ];
lr = [dim(1);dim(2);1];

tul =  T*ul;
tur =  T*ur;
tll =  T*ll;
tlr =  T*lr;

sx = min([tul(1) tur(1) tll(1) tlr(1)]);
bx = max([tul(1) tur(1) tll(1) tlr(1)]);

sy = min([tul(2) tur(2) tll(2) tlr(2)]);
by = max([tul(2) tur(2) tll(2) tlr(2)]);

N = zeros([ceil(bx - sx), ceil(by -sy) dim(3)]);

    for x = 1:size(N,1) 
        for y = 1:size(N,2)
            % original O
            A = [x+sx;y+sy;1];
            C = TI*A;
            % around centre
            C = C + [1;1;0];
            xn = C(1,1)/w;
            yn = C(2,1)/w;
            %disp(size(N));
            intensity= resample(I,xn,yn);
            %disp(size(intensity));
            N(x,y,:) = intensity;
            %disp(x);
        end
    end
