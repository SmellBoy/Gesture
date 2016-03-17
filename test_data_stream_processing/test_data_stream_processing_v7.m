function [x,y] = test_data_stream_processing_v7(filename,A)
fprintf('filename = %s\n', filename);
load(filename)
filename(filename=='_') = '-';
% f = 'C:\Users\DANA\Desktop\Daily health monitoring system 160219\';
% filename_gif = [f filename '.gif'];
% delaytime = 0.01;
for F = 1:size(A,4);
    test_data_stream_processing_v5(filename,A,F,40,40);
    m = 40;
    n = 40;
    x = A(n,:,1,F)-A(n,:,2,F);
    y = A(:,m,1,1)-A(:,m,2,1);
    %     [imind, cm] = rgb2ind(frame2im(getframe(gcf)),256);
    %     if F == 1;
    %         imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf);
    %     else
    %         imwrite(imind,cm,filename_gif,'gif','WriteMode','append','DelayTime',delaytime);
    %     end
    pause(0.001);
end