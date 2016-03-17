%%
% vid = videoinput('winvideo', 1, 'RGB24_1600x1200');
vid = videoinput('winvideo', 1, 'RGB24_160x120');
preview(vid);
%%
cd 'C:\Users\DANA\Desktop\Daily health monitoring system 160219';
addpath(genpath(pwd));
I = imread('Res\door.jpeg');
B = imread('Res\green_bird.jpg');
image(I);
box off;
axis off;
B = B(1:50:end,1:50:end,:);
I = I(1:10:end,1:10:end,:);
%%
% sigma = 1.6;
% gausFilter = fspecial('gaussian',[5 5],sigma);
% B(:,:,3) = imfilter(B(:,:,3),gausFilter,'replicate');
% image(B)
%%
% mu = [0 0];
% Sigma = [0.5 0.1;0.1 .5];
% [X,Y] = meshgrid(-1:0.2:1,-1:0.2:1);
% p = mvnpdf([X(:) Y(:)],mu,Sigma);
% p = 1-reshape(p,size(X));
% for i = 1:11
%     for j = 1:11
%         B(i,j,1) = B(i,j,1)*p(i,j);
%         B(i,j,2) = B(i,j,2)*p(i,j);
%         B(i,j,3) = B(i,j,3)*p(i,j);
%     end
% end
% subplot(211)
% imagesc(p)
% colorbar
% subplot(212)
% image(B)
%%
n = 1;
A = I;
image(A);
y = zeros(1,10);
A1 = getsnapshot(vid);
A2 = getsnapshot(vid);
for F = 1:100
    I = A;
    for n = 2:3:size(I,2)-2
        A1 = getsnapshot(vid);
        x = mean(A1(:,:,1)-A2(:,:,1),2);
        x = max(0,min(size(A,1)-11,find(x==max(x),1)));
        y(1) = [];
        y = [y,x];
        x = fix(mean(y));
        A(:,1:end-n,:) = I(:,1+n:end,:);
        A(:,end-n:end,:) = I(:,1:1+n,:);
        C = A;
        C(1+x:11+x,1+20:11+20,:) = B;
        A2 = getsnapshot(vid);
        image(C(1:1:end,1:1:end,:));
        axis([1 size(C,2) 1 size(C,1)]);
        axis off;
        pause(0.0001);
    end
end

