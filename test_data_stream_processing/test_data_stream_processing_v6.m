function X = test_data_stream_processing_v6(filename)
fprintf('filename = %s\n', filename);
load(filename)
filename(filename=='_') = '-';
filename_gif = [filename '.gif'];
delaytime = 0.01;
for F = 1:size(A,4);
    test_data_stream_processing_v5(filename,A,F,40,40);
    [imind, cm] = rgb2ind(frame2im(getframe(gcf)),256);
    if F == 1;
        imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename_gif,'gif','WriteMode','append','DelayTime',delaytime);
    end
    pause(0.001);
end
