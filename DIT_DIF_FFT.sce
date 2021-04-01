clc;
clear;
close;

function [X]=DIT_FFT(x)
    t = nextpow2(length(x)); 
    j = [x zeros(1,(2^t)-length(x))] ; 
    N = length(j); 
    S = log2(N); 
    j = j(:,$:-1:1); 
    for stage=1:S 
        a = 1; 
        b = 1+2^(stage-1);
        n=0;
        while(n<=2^(stage-1)-1 && b<=N)
            e = exp((-1*%i)*2*%pi*n/(2^stage)); 
            y = j(a)+e*j(b); 
            z = j(a)-e*j(b);
            j(a) = y;
            j(b) = z;
            a = a+1;
            b = b+1; 
            n = n+1;
            if(modulo(b,2^stage)== 1)
                a = a+2^(stage-1); 
                b = b+2^(stage-1);
                n = 0;
            end
        end
    end
    X = j;
endfunction

function [X]=DIF_FFT(x)
    t = nextpow2(length(x));                       
    j = [x zeros(1,(2^t)-length(x))] ;             
    N = length(j);                                 
    S = log2(N);                                   
    for stage=S:-1:1
        a = 1;
        b = 1+2^(stage-1);                
        n = 0;
        while( n<=2^(stage-1)-1  && a<=N && b<=N)
            l = (n).*(2^(S+1-stage))./2;
            e = exp((-1*%i)*2*%pi*l/(16));            
            y = j(a)+j(b);
            z = (j(a)-j(b)).*e;                 
            j(a) = y;
            j(b) = z;
            a = a+1;                               
            b = b+1;
            n = n+1;
            if (stage == 1)               
                if(modulo(1,a) == 1)            
                    a = a+2^(stage-1);
                    b = b+2^(stage-1);
                    n=0;
                end
            end
            
            if(stage~=1)
                if(modulo(a,2^(stage-1))==1)
                    a = a+2^(stage-1);
                    b = b+2^(stage-1);
                    n = 0;
                end
            end
        end
    end                 
    X = j(:,$:-1:1);
endfunction


//Four point sequence
x4=[1, 2+2*%i,2,2-2*%i,1-1*%i,0,1+1*%i,0];
N1=length(x4);
r=[0:N1-1];
scf(0);
plot2d3(r,abs(x4));
title('Plot of magnitude of x(n)','FontSize');
xlabel('n','FontSize');
ylabel('|x|','FontSize');
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

scf(1);
r=[0:N1-1];
plot2d3(r,atan(imag(x4),real(x4)));
title('Plot of phase of x(n)','FontSize');
xlabel('n','FontSize');
ylabel('angel(x)','FontSize');
e = gce(); 
e.children.thickness = 4;
//a=gca()
//a.x_location = "origin"; 
//a.y_location = "origin";

X4=DIT_FFT(x4);
disp("DIT FFT of x : ");
disp(X4);
scf(2);
r=[0:N1-1];
plot2d3(r,abs(X4));
title('Plot of magnitude of X(k)','FontSize');
xlabel('n','FontSize');
ylabel('angel(x)','FontSize');
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

scf(3);
r=[0:N1-1];
plot2d3(r,atan(imag(X4),real(X4)));
title('Plot of phase of X(k)','FontSize');
xlabel('n','FontSize');
ylabel('angel(x)','FontSize');
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

X_4 = DIF_FFT(x4)
disp("DIF FFT of x : ");
disp(X_4);
scf(4);
r=[0:N1-1];
plot2d3(r,abs(X_4));
title('Plot of magnitude of X(k)','FontSize');
xlabel('n','FontSize');
ylabel('angel(x)','FontSize');
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

scf(5);
r=[0:N1-1];
plot2d3(r,atan(imag(X_4),real(X_4)));
title('Plot of phase of X(k)','FontSize');
xlabel('n','FontSize');
ylabel('angel(x)','FontSize');
e = gce(); 
e.children.thickness = 4;
a=gca()
a.x_location = "origin"; 
a.y_location = "origin";

