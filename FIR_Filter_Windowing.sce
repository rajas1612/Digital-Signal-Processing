clear; 
clc; 
close;

pi=%pi;
M=5; // 2*Tau + 1 = M
Tau=2; 
n=0:1:Tau; 
hd=zeros(1,Tau+1); 
Wh=zeros(1,Tau+1);

//CALCULATING hd
for i = 1 : length(n) 
    if n(i)==Tau
        hd(i)=0.25;
    else
        hd(i)=sin(pi/4*(n(i)-Tau))/(pi*(n(i)-Tau)); 
    end
end 

scf(1);
complete_hd = [hd,flipdim(hd(1:Tau),2)];
title("Plot of hd(n)");
plot2d3(complete_hd);
xlabel("n");
ylabel("hd(n)");
e = gce(); // get current entity to change the thickness of the graph plots 
e.children.thickness = 4;
a = gca(); // get current axes to change axis properties
a.x_location = "origin"; 
a.y_location = "origin";
a.title.font_size = 5;
// CALCULATING coefficients
for i=0:length(hd)-1 
    if i-(M-1)/2 > 0
        k= i - (M-1)/2;
    else
        k= (M-1)/2 - i;
    end
    Wh(i+1)=1-2*k/(M-1);
end

scf(2);
complete_Wh = [Wh,flipdim(Wh(1:Tau),2)]; 
plot2d3(complete_Wh);
title("Plot of Bartlett Window"); 
xlabel("n");
ylabel("Wh(n)");
e = gce(); // get current entity to change the thickness of the graph plots 
e.children.thickness = 4;
a = gca(); // get current axes to change axis properties
a.x_location = "origin"; 
a.y_location = "origin";
a.title.font_size = 5;
H=hd.*Wh //element wise multiplication
scf(3); 
complete_H=[H,flipdim(H(1:Tau),2)]; 
plot2d3(complete_H);
title("Plot of H(n)");
xlabel("n");
ylabel("H(n)");
e = gce(); // get current entity to change the thickness of the graph plots 
e.children.thickness = 4;
a = gca(); // get current axes to change axis properties
a.x_location = "origin"; 
a.y_location = "origin";
a.title.font_size = 5;

w = -%pi:0.01:%pi;
Hw= zeros(1,length(w)); 
phase_Hw= zeros(1,length(w)); 
for i=1:length(w)
    for j=1:length(H) 
        if j==Tau+1
            Hw(i) = Hw(i) + H(j);
        else
            Hw(i) = Hw(i)+H(j)*cos(w(i)*(Tau- j+1))*2;
        end
    end
    if Hw(i)>0
        phase_Hw(i) = -Tau*w(i); 
    else
        phase_Hw(i) = %pi - Tau*w(i); 
    end
end

scf(4); 
plot2d3(w,Hw);
title("Magnitude response"); xlabel("w");
ylabel("H(w)");
e = gce(); // get current entity to change the thickness of the graph plots 
e.children.thickness = 4;
a = gca(); // get current axes to change axis properties
a.x_location = "origin"; 
a.y_location = "origin";
a.title.font_size = 5;
scf(5); 
plot2d3(w,phase_Hw); 
title("Phase response"); 
xlabel("w"); 
ylabel("Phase angle");
e = gce(); // get current entity to change the thickness of the graph plots 
e.children.thickness = 4;
a = gca(); // get current axes to change axis properties
a.x_location = "origin"; 
a.y_location = "origin";
a.title.font_size = 5;
