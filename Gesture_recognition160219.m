vid = videoinput('winvideo', 1, 'RGB24_160x120');
preview(vid);
A = getsnapshot(vid);

%%
num  = 20;
name = 'test_getsnapshot_time.mat';
for n = 1:10000
    t = clock;
    if t(4)>18
        break;
    else
        get_img(vid,num,name);
    end
end