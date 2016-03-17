function test_data_stream_processing_v5(filename,A,F,n,m)
% F = 1;
% n = 40;
% m = 40;
x = A(n,:,1,F)-A(n,:,2,F);
y = A(:,m,1,F)-A(:,m,2,F);

subplot(221);image(A(:,:,:,F));title(filename);
subplot(222);plot(x);axis tight;
subplot(223);plot(y);axis tight;
