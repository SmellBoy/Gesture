%% path set
paths.main   = 'C:\Users\DANA\Desktop\Daily health monitoring system 160219\';
paths.sample = [paths.main 'Sample\'];
paths.gif    = [paths.main 'Gif\'];
paths.cache  = [paths.main 'Cache\'];
paths.trait  = [paths.main 'Trait\'];
paths.table  = [paths.main 'Table\'];

%% path detect or creat

%% filename set
data_real = 'test_getsnapshot_time.mat';
m = 40;
n = 40;
F = 1;

%%
% 主路径分配
paths.main = paths.main;
cd( paths.main );
% 更新缓存路径文件
try
    copyfile( data_real, paths.cache );
catch
    fprintf('Error in copyfile to cache.\n');
end

% 导入缓存路径文件
file_tb = ls( paths.cache );
if size(file_tb,1)>2
    load( [paths.cache data_real] )
else
    fprintf('Error in load cache.\n');
end

%% get trait
x = zeros(1,size(A,2));
y = zeros(1,size(A,1));
for F = 1:size(A,4)
    x(F,:) = A(n,:,1,F)-A(n,:,2,F);
    y(F,:) = A(:,m,1,F)-A(:,m,2,F);
end

%% save sample and trait
data_id = datestr(now,30);
data_id(data_id=='T') = '_';
samplefile = [paths.sample 'sample_' data_id '.mat'];
traitfile  = [paths.trait 'trait_' data_id '.mat'];
save( samplefile, 'A' );
save( traitfile, 'x', 'y' );

