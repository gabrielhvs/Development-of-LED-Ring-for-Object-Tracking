%%Dados do Led
theta = 30;
m = (-log(2))/log(cos(deg2rad(theta/2)));
N=10;
E0 = 1;

%% Dados da Arena
Alt_Cam = 2.6;
Raio_Ar = 3;
z = sqrt((Alt_Cam^2)+(Raio_Ar^2));
Cam_theta = atan2(Alt_Cam,Raio_Ar)

%% Dados do Ring_Light
p = 0.3;



%% Dados da Simulação
Dim = 20;
x = linspace(-10,10,Dim);
y = linspace(-10,10,Dim);
Ev = zeros(Dim,Dim);
e =  zeros(Dim,Dim);

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
    


figure(1)
surf(x,y,zp)



%% Simulação
for n=1:N
    for j=1:Dim
        for i=1:Dim
            
            E = ((zp(i,j))^m)*E0*(((x(i)-p*cos(2*pi*n/N))^2)+((y(j)-p*sin(2*pi*n/N))^2)+(zp(i,j))^2)^(-(m+2)/2);
            size(E)
            
            Ev(i,j) = E;
            E=0;
            
        end
    end
    
    e = [e Ev];
end

size(e)

e = real(e(:,Dim:(N+1)*Dim-1));

Ev = zeros(Dim,Dim);
figure(2)
hold on
for n=1:N
    
           
    Ev= Ev  + (e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1)));
    
    contour(x,y,(e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1))))
           
    
end

hold off

figure(3)
contour(x,y,Ev)

figure(4)
surf(x,y,Ev)

figure(5)
plot(y,Ev(Dim/2,:))








            
