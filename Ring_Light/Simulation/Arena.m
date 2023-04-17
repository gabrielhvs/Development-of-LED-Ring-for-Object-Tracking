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
p = 0.03;



%% Dados da Simulação
Dim = 20;
x = linspace(-10,10,Dim);
y = linspace(-10,10,Dim);
z = linspace(-10,10,Dim);
Ev = zeros(Dim,Dim);
e =  zeros(Dim,Dim);


%% Simulação
for n=1:N
    for j=1:Dim
        for i=1:Dim
            for k=1:Dim
            rot = [cos(Cam_theta) sin(Cam_theta); -sin(Cam_theta) cos(Cam_theta)]*[x(i); z(k)];    
            E = ((zt)^m)*E0*(((xt-p*cos(2*pi*n/N))^2)+((y(j)-p*sin(2*pi*n/N))^2)+(zt)^2)^(-(m+2)/2);
            Ev(i,j) = E;
            E=0;
            end
        end
    end
    
    e = [e Ev];
end

size(e)

e = e(:,Dim:(N+1)*Dim-1);

Ev = zeros(Dim,Dim);
figure(1)
hold on
for n=1:N
    
           
    Ev= Ev  + (e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1)));
    
    contour(x,y,(e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1))));
           
    
end

hold off

figure(2)
contour(x,y,Ev)

figure(3)
surf(x,y,Ev)

figure(4)
plot(y,Ev(Dim/2,:))








            
