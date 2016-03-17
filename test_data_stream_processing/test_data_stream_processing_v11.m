
data_real = 'test_getsnapshot_time.mat';
load([paths.main data_real])
m = 40;
n = 40;
F = 1;
x = zeros(1,size(A,2));
y = zeros(1,size(A,1));
for F = 1:size(A,4)
    x(F,:) = A(n,:,1,F)-A(n,:,2,F);
    y(F,:) = A(:,m,1,F)-A(:,m,2,F);
end
Xi = [x y];

Xi = reshape( Xi, size(Xi,3), size(Xi,1)*size(Xi,2) );
[Y1] = NN_GR02(Xi');
[Y2] = NN_GR03(Xi');
fprintf('Y1 = %.2f Y2 = %.2f\n', Y1, Y2 );