load('test_getsnapshot_time.mat');

C = A(:,:,1,1)-A(:,:,3,2);
Row = fix(linspace(1,size(C,1),4));
Col = fix(linspace(1,size(C,2),4));
B = A(:,:,1,1);
C = B(40:80,54:107);
x = fix(diff(Col(2:3))/2);
y = Row(2);

theta  = 0:5:180;
radius = 5:3:50;
Y  = nan;
for m = 1:length(radius)
    xi = fix(x-radius(m).*cosd(theta));
    yi = fix(radius(m).*sind(theta))+1;
    for n = 1:length(theta)
        Y(m,n)  = A(Row(2)+xi(n),Col(2)+yi(n));
    end
    
end

figure(6)
% hold on
% plot(theta,Y)
pcolor(Y);colorbar
line = Y(end-1,:);
figure(7);plot(line);