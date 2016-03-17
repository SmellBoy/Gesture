
load('test_getsnapshot_time.mat');

C = A(:,:,1,1)-A(:,:,3,2);
Row = fix(linspace(1,size(C,1),4));
Col = fix(linspace(1,size(C,2),4));
B = A(:,:,1,1);
C = B(40:80,54:107);
x = fix(diff(Col(2:3))/2);
y = Row(2);

figure(1);
contour(rgb2gray(A(40:80,54:107,:,1)));axis ij;
figure(2);mesh(C);axis ij;view(10,45);
figure(3);surf(C);axis ij;view(10,65);
figure(4);bar3(C);axis ij;view(10,45);
figure(5);
clf;hold on;bar3(C);mesh(C);view(210,55);axis tight;
