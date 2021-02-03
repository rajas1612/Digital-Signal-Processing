clear;
clc;
close;

x = [-3 -6 11 -8];
n1 = [0 1 2 3];
h = [5 -10 -4];
n2 = [0 1 2];
title('x[n]');
xlabel("No of Samples");
ylabel("Magnitude of x(n)")
plot2d3(n1, x); 
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

scf(1);
title('h[n]');
plot2d3(n2, h); 
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";

//Linear Convolution
m = length(x);
n = length(h);

for i = 1:n+m-1
    conv_sum = 0;
    for j = 1:i
        if (((i - j +1) <= n ) &(j <= m ))
            conv_sum = conv_sum + x ( j ) * h (i -j +1) ;
        end;
        y ( i ) = conv_sum ;
    end;
end;
disp("Linear Convolution Output=");
disp (y);
scf(2);
title('Linear Convolution');
n3 = 0: length(y)-1;
plot2d3(n3, y);
e = gce();
e.children.thickness = 4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";


//Circular convolution
m=length(x);
n=length(h);
n4 = [0,1,2,3];
if (m>n)
    for i = n + 1 : m
        h(i) = 0;
    end
elseif (n>m)
    for i = m + 1 : n
        x(i) = 0;
    end
end
h1=circshift(h,1);
h2=circshift(h,2);
h3=circshift(h,3);
h_1= cat(2, h', h1', h2', h3');
y1=h_1*x';
printf("y(n) Circular convolution=");
disp(y1);
scf(3);
title("Circular Convolution y(n)","fontsize", 5);
xlabel("n", "fontsize", 4);
ylabel("mag of y(n)","fontsize",4);
plot2d3('gnn',n4,y1);
b = gca();
b.font_size = 3;
b.x_location = "origin";
b.y_location = "origin";
a = gce();
a.children.thickness = 3

//Linear Convolution using Circular Convolution
z =length(x)+length(h)-1;
h =[h,zeros(1,(z-length(h)))];
x =[x,zeros(1,(z-length(x)))] ;
for i=1:z 
    w(1,z)=0;
    for j=1:z
        k=i-j+1;
        if k <=0 then
            k=z+k;
        end ;
        w(i)=w(i)+x(j)*h(k);
    end ;
    end ;
disp ('Linear Convolution using Circular Convolution Output : ' ) ;
disp(w);
scf(4) ;
title('Linear Convolution using Circular Convolution' , 'fontsize' , 5 ) ;
n5 =0:length(w)-1;
plot2d3(n5,w);
e=gce();
e.children.thickness=4;
a = gca();
a.x_location = "origin";
a.y_location = "origin";
