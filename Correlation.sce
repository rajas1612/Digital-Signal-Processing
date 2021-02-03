//Autocorrelation of a given Input Sequence
clear; 
clc; 
close;

//INPUT
x =[10,-8,-11,-9,7];
L = length(x); 
t=[0:L-1];
scf(0);
plot2d3(t,x);
title('Plot of x(n)','FontSize',4);
//xlabel ('Sample Number(n)','FontSize',3 ); 
ylabel ('Amplitude', 'FontSize',3) ;
e = gce(); e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

//AUTO CORRELATION
h = zeros(1,L); 
for i = 1:L
    h(L-i+1) = x(i);
end
N = 2*L-1;
Rxx = zeros(1,N); 
for i = L+1:N
    h(i) = 0;
end;
for i = L+1:N 
    x(i) = 0;
end
for n = 1:N 
    for k = 1:N 
        if(n >= k)
            Rxx(n) = Rxx(n)+x(n-k+1)*h(k); 
         end;
    end;
end;

disp(' Auto Correlation Result is') 
disp(Rxx);
L_1 = length(Rxx); 
t=[0:L_1-1];
scf(1); 
plot2d3(t,Rxx);
title('Plot of Auto Correlation of x[n]','FontSize',4); 
//xlabel ('Sample Number(n)','FontSize',3 ); 
ylabel ('Amplitude', 'FontSize',3) ;
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin";
a.y_location = "origin";

//delayed input
y =[0, 5,-10,-15,8,-7];
L1 = length(y); 
t=[0:L1-1];
scf(2); 
plot2d3(t,y);
title('Plot of Delayed x(n)','FontSize',4); 
//xlabel ('Sample Number','FontSize',3 ); 
ylabel ('Amplitude', 'FontSize',3) ;
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

disp("Delayed  Input");
disp(y);

//AUTO CORRELATION OF DELAYED X[N]
h1 = zeros(1,L1); 
for i = 1:L1
    h1(L1-i+1) = y(i);
end;
N1 = 2*L1-1;
Rxx1 = zeros(1,N1); 
for i = L1+1:N1
    h1(i) = 0;
end;
for i = L1+1:N1 
    y(i) = 0;
end;
for i = 1:N1 
    for k = 1:N1 
        if(i >= k)
            Rxx1(i) = Rxx1(i)+y(i-k+1)*h1(k); 
        end;
    end; 
end;
disp('Auto Correlation Result of delayed x(n) is')
disp(Rxx1);
L_1 = length(Rxx1); 
t=[0:L_1-1];
scf(3); 
plot2d3(t,Rxx1);
title('Plot of Auto Correlation of Delayed x(n)','FontSize',4);
//xlabel ('Sample Number','FontSize',3 ); 
ylabel ('Amplitude', 'FontSize',3) ;
e = gce();
e.children.thickness = 4; 
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

//cross correlation of x[n] and delayed x[n]
x =[5,-10,-15,8,-7];
y =[0, 5,-10,-15,8,-7];
mx = length ( x ) ; 
my = length ( y ) ; 
lx = 0;
ly = 0;
hx = lx + mx -1; 
n = lx :1: hx;
x_fold = x( $ : -1:1) ;
y_fold = y( $ : -1:1) ; 
nx = lx + ly ;
ny = nx+ mx + my -2;
r = nx : ny ;
Rxy = convol (x , y_fold ) ; 
Ryx = convol ( x_fold , y) ;
disp('Cross Correlation of x(n) and Delayed x(n) is')
disp(Rxy);
count =1;
L2 = length(Rxy); 
q=[0:L2-1];
scf(4); 
plot2d3(q,Rxy);
title('Plot of Cross Correlation of x(n) and Delayed x(n)','FontSize',4);
//xlabel ('Sample Number','FontSize',3 );
ylabel ('Amplitude', 'FontSize',3) ; 
e = gce();
e.children.thickness = 4; 
a=gca()
a.x_location = "origin";
a.y_location = "origin";
//Cross corelation of i/p and scaled delay i/p
x = [5,-10,-15,8,-7];
y1 = 3*[5,-10,-15,8,-7];
L4 = length(y1); 
t4=[0:L4-1];
scf(5); 
plot2d3(t4,y1);
title('Plot of Delayed Scaled Input x(n)','FontSize',4);
//xlabel ('Sample Number(n)','FontSize',3 ); 
ylabel ('Amplitude', 'FontSize',3) ;
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";
disp("Scaled Delayed Input is") 
disp(y1)
mx1 = length ( x ) ;
my1 = length ( y1 ) ; 
lx1 = 0;
ly1 = 0;
hx1 = lx1 + mx1 -1; 
n1 = lx1 :1: hx1 ;
x_fold1 = x( $ : -1:1) ;
y_fold1 = y1( $ : -1:1) ; 
nx1 = lx1 + ly1 ;
ny1 = nx1 + mx1 + my1 -2; 
r1 = nx1 : ny1 ;
Rxy1 = convol (x , y_fold1 ) ;
Ryx1= convol ( x_fold1 , y1) ;
disp('Cross Correlation of x(n) and Scaled and Delayed x(n) is')
disp(Rxy1);
count =1;
L21 = length(Rxy1); 
q1=[0:L21-1];
scf(6); 
plot2d3(q1,Rxy1);
title('Cross Correlation of x(n) and Scaled and Delayed x(n)','FontSize',4);
//xlabel ('Sample Number','FontSize',3 ); 
ylabel ('Amplitude', 'FontSize',3) ;
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";
