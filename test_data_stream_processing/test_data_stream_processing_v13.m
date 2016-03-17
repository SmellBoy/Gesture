%%
vid = videoinput('winvideo', 1, 'RGB24_160x120');
preview(vid);
A = getsnapshot(vid);
%%
for F = 2:1000000;
    A1 = getsnapshot(vid);
    pause(0.01);
    A2 = getsnapshot(vid);
    x = mean(A1(:,:,1)-A2(:,:,1),2);
    x = find(x==max(x),1);
    B = A2;
    B(x+10:100,71:108,1) = 1;
    B(x+10:100,71:108,2) = 1;
    image(B);
    pause(0.02);
end

