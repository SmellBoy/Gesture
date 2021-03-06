function test_data_stream_processing_v2
A = nan;
load('test_getsnapshot_time.mat');
%%
dt = mean(diff(t));
clf;
hold on;
for n = 2:20;
    [x,y] = hand_center(A(:,:,:,n-1:n));
    plot(n,x,'bo',n,y,'m*');
    pause(dt);
end
function [x,y] = hand_center(A)
%%
% figure(1);image(A(:,:,:,1));
% figure(2);imagesc(A(:,:,1,1)-A(:,:,3,1))
% figure(3);plot(A(10,:,1,1))
%%
B = A(:,:,1,1)-A(:,:,3,1);
% figure(4);imagesc(A(:,:,1,1)-A(:,:,3,2))
%%
C = A(:,:,1,1)-A(:,:,3,2);
Row = fix(linspace(1,size(C,1),4));
Col = fix(linspace(1,size(C,2),4));
D = zeros;
for row = 1:3
    for col = 1:3
        D(row,col) = mean(mean(C(Row(row):Row(row+1),Col(col):Col(col+1))));
    end
end
%%
% figure(5);image(D)
% figure(6);bar3(D)
%%
[x,y] = find(D==max(max(D)),1);
if x==2 && y==2
    disp('Detect position is OK.')
else
    disp('Can not detect position.')
end