%% path set
paths.main   = 'C:\Users\DANA\Desktop\Daily health monitoring system 160219\';
paths.sample = [paths.main 'Sample\'];
paths.gif    = [paths.main 'Gif\'];
paths.cache  = [paths.main 'Cache\'];
paths.trait  = [paths.main 'Trait\'];
paths.table  = [paths.main 'Table\'];

%%
trait_tb = ls(paths.trait);
trait_file = trait_tb(N,:);
load( [ paths.trait trait_file ] );
X = [x y];
for N = 3:size(trait_tb,1)
    trait_file = trait_tb(N,:);
    load( [ paths.trait trait_file ] );
    X(:,:,N-2) = [x y];
end

%%
Type.x = kmeans( reshape( X, size(X,3), size(X,1)*size(X,2) ), 20 );
Type.y = kmeans( reshape( X, size(X,3), size(X,1)*size(X,2) ), 20 );
plot( Type.x, Type.y )

%%
figure(1)
plot( Type );
axis tight;

%%
trait_tb(3,:)
%%
Type = kmeans( reshape( X, size(X,3), size(X,1)*size(X,2) ), 20 );
a = std(std(X));
Std = reshape( a, length(a),1 );
a = mean(mean(X));
Avg = reshape( a, length(a),1 );
a = rand(20,3);
b = { 'o' '+' '*' 'p' '.' '>' '<' 'ro' 'go' 'bo' ...
    'o' '+' '*' 'p' '.' '>' '<' 'ro' 'go' 'bo' ...
    'o' '+' '*' 'p' '.' '>' '<' 'ro' 'go' 'bo' };
clf;
hold on;
for n = 1:length(Type)
    plot( Avg(n), Std(n), b{Type(n)}, 'Color', a(Type(n),:) )
end
box on;
%%
Type = kmeans( reshape( X, size(X,3), size(X,1)*size(X,2) ), 20 );
[ c, d ] = sort(Type); plot( d, 'o-' )
%%
T = '';
%%
for N = 3:size(trait_tb,1)
    n = N-2;
    trait_file = ['sample' trait_tb(N,end-19:end)];
    load( [ paths.sample trait_file ] );
    
    clf;
    subplot(331); image(A(:,:,:,01)); title('F01');
    subplot(332); image(A(:,:,:,10)); title('F10');
    subplot(333); image(A(:,:,:,20)); title('F20');
    subplot(312); hold on; title('Type'); grid on; box on;
    plot( Type, 'k.-' ); plot( n, Type(n), 'mo' );
    subplot(325); image(X(:,:,n));
    subplot(326); plot(X(:,:,n)');
    pause(0.1);
    T{n} = input('ÊÖÊÆ£º', 's');
end