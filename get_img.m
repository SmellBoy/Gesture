function get_img(vid,num,name)
if nargin<3
    name = 'test_getsnapshot_time.mat';
end
if nargin<2
    num = 20;
end

%%
tic;
A = getsnapshot(vid);
t = zeros;
for i=1:num;
    A(:,:,:,i) = getsnapshot(vid);
    t(i)=toc;
end

%%
save(name,'A','t');
