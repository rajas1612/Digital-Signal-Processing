clear;
clc;
close;

x = [5-4*%i,2-2*%i,-4,-6];
N = [0,1,2,3];

//Plotting magnitude of input signal
scf(1);
title('Plot of magnitude of x(n)','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3(N, abs(x));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";


//Plotting phase of input signal
scf(2);
title('Plot of phase of x(n)','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N,atan(imag(x),real(x)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Calculating and plotting the magnitude of DFT of the input signal
n = length(x);
X = zeros(1,n);
for k=0:n-1
 for j=0:n-1
 X(k+1) = X(k+1)+x(j+1)*(cos(2*%pi*k*j/n)-sin(2*%pi*k*j/n)*1*%i);
 end
end
disp('DFT of input signal : ');
disp(X);
scf(3);
title('Plot of magnitude of X(k)','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3(N, abs(X));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Calculating and plotting the phase of DFT of the input signal
scf(4);
title('Plot of phase of X(k)','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N,atan(imag(X),real(X)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Calculating and plotting magnitude of the IDFT of the spectrum
x1 = zeros(1,n);
for k=0:n-1
 for j=0:n-1
 x1(k+1) =x1(k+1)+X(j+1)*(cos(2*%pi*k*j/n)+sin(2*%pi*k*j/n)*1*%i);
 end;
 x1(k+1) = x1(k+1)/n;
end;
disp('IDFT of output signal :');
disp(x1);
scf(5);
title('Plot of magnitude ofIDFT of X(k)','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3(N, abs(x1));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Calculating and plotting phase of the IDFT of the spectrum
scf(6);
title('Plot of phase of IDFT of X(k)','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N,atan(imag(x1),real(x1)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Appending zeros at the end ofthe input signal and calculating and plotting DFT
N1 = [0,1,2,3,4,5,6,7];
x2 = [5-4*%i,2-2*%i,-4,-6,0,0,0,0];
scf(7);
title('Plot of magnitude of x(n) with zeros appended','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3(N1, abs(x2));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";
scf(8);
//plotframe([0 -2 3 2]);
title('Plot of phase of x(n)with zeros appeneded','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N1,atan(imag(x2),real(x2)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";


X = zeros(1,length(x2));
for k=0:length(x2)-1
 for j=0:length(x2)-1
 X(k+1) = X(k+1)+x2(j+1)*(cos(2*%pi*k*j/length(x2))-sin(2*%pi*k*j/length(x2))*%i);
 end
end
disp('DFT of input signal with zeros appended at the end : ');
disp(X);
scf(9);
title('Plot of magnitude of X(k) with zeroes appended','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3(N1,abs(X));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

scf(10);
title('Plot of phase of X(k) with zeroes appended','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N1,atan(imag(X),real(X)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Adding zeros at alternateindices and calculating andplotting DFT
x3 = [5-4*%i,0,2-2*%i,0,-4,0,-6,0]
scf(11);
title('Plot of magnitude of x(n) with zeroes at alternate positions','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3('gnn',N1, abs(x3));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

scf(12);
title('Plot of phase of x(n) with zeroes at alternate positions','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N1,atan(imag(x3),real(x3)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

X1 = zeros(1,length(x3));
for k=0:length(x3)-1
 for j=0:length(x3)-1
 X1(k+1) = X1(k+1)+x3(j+1)*(cos(2*%pi*k*j/length(x3))-sin(2*%pi*k*j/length(x3))*1*%i);
 end;
end;
disp('DFT of input signal with alternate zeros: ');
disp(X1);
scf(13);
title('Plot of magnitude of X(k) with zeroes at alternate positions','FontSize',4);
xlabel('n','FontSize',4);
ylabel('|x|','FontSize',4);
plot2d3(N1, abs(X1));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

scf(14);
title('Plot of phase of X(k) with zeroes at alternate positions','FontSize',4);
xlabel('n','FontSize',4);
ylabel('∠x','FontSize',4);
plot2d3(N1,atan(imag(X1),real(X1)));
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";
