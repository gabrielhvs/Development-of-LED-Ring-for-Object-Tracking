clear all
close all
%% Dados do Led
theta = 30;
m = (-log(2))/log(cos(deg2rad(theta/2)));
N=15;
E0 = 1;
Dim=100;

%% Dados da Arena
Alt_Cam = 2.6;
Raio_new = 3;
Raio_Ar = 3;
DiffR = Raio_Ar-Raio_new;
z = sqrt((Alt_Cam^2)+(Raio_Ar^2));
Cam_theta = atan2(Raio_new,Alt_Cam);
axis equal
p = sqrt(2/(2+m))*z;

x = linspace(-3,3,Dim);
y = linspace(-3,3,Dim);

%% Plano 

xv = 0; yv = 0; zv = 1;
xp = 1; yp = 0; zp = 0;



rotv = [cos(Cam_theta) 0 sin(Cam_theta);0 1 0 ; -sin(Cam_theta) 0 cos(Cam_theta)]*[xv; yv; zv];
rotp = [cos(Cam_theta) 0 sin(Cam_theta);0 1 0 ; -sin(Cam_theta) 0 cos(Cam_theta)]*[xp; yp; zp]; 

D = -(rotv(1)*rotp(1)+rotv(2)*rotp(2)+rotv(3)*rotp(3));


zp = zeros(Dim,Dim);



for j=1:Dim
        for i=1:Dim
            
         zp(i,j) = -(D + rotv(1)*x(i)+rotv(2)*y(j)) /rotv(3);
          
        end
end

zp=zp + z;

%% Intensidade luminosa  
E0 = 1;

Ev = zeros(Dim,Dim);

e =  zeros(Dim,Dim);

for n=1:N
    for i=1:Dim
        for j=1:Dim
            E = (zp(i,j)^m)*E0*(((x(i)-DiffR-p*cos(2*pi*n/N))^2)+((y(j)-p*sin(2*pi*n/N))^2)+zp(i,j)^2)^(-(m+2)/2);
            Ev(i,j) = E;
            E=0;
        end
    end
    
    e = e + Ev;
end
Ev = real(e);



%% Junção de Rings


Ev1 = real(Ev);
Ev2 = rot90(Ev1);
Ev3 = rot90(Ev2);
Ev4 = rot90(Ev3);

E_arena = Ev1+Ev2+Ev3+Ev4;
figure(1)
surf(x,y,E_arena)

%% Variance calc


Var_Ilumi1 = 100*var(E_arena,0,1)./mean(E_arena,1);
Var_Ilumi2 = 100*var(E_arena,0,2)./mean(E_arena,2);
figure(2)
plot(x,Var_Ilumi1,y,Var_Ilumi2);






            
