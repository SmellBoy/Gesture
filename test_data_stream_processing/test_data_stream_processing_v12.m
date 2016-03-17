load('test_getsnapshot_time.mat')


for F = 1:size(A,4);image(A(:,:,:,F));pause(0.02);end


%%
C = A;
for F = 2:size(A,4);
    x = mean(A(:,:,1,F-1)-A(:,:,1,F),2);
    x = find(x==max(x),1);
    B = A(:,:,:,F);
    B(x+10:100,71:108,1) = 1;
    B(x+10:100,71:108,2) = 1;
    C(:,:,:,F) = B;
    image(B);
    pause(0.02);
end
A = C;
name = 'test_B.mat';
save(name,'A','t');
%%

test_data_stream_processing_v6(name)
