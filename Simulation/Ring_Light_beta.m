
Alt_Cam = 2.6;
Raio_Ar = 3;
d = sqrt((Alt_Cam^2)+(Raio_Ar ^2));

theta = 30;

m = (-log(2))/log(cos(deg2rad(theta/2)));

N=4;
Dim = 100;

x = linspace(-5,5,Dim);
y = linspace(-5,5,Dim);

plane = zeros(N, Dim, Dim);

p0 = 0.03; %sqrt(2/(m+3))*d;

beta = 4.5*pi/18;


%%
%% Create Planes
for n=1:N
    theta = 2*pi*n/N;
    z = p0/tan(beta);
    vec = [p0*cos(theta); p0*sin(theta); z];
    point =  [p0*cos(theta); p0*sin(theta); 0];
    D = vec(1)*point(1)+vec(2)*point(2)+vec(3)*point(3);
    for i=1:Dim
        for j=1:Dim
            plane(n,i,j) = (-D -vec(1)*x(i) -vec(2)*y(j))/vec(3);  
        end
    end
end

%% Plot Planes
figure(1)
hold on
z = zeros(Dim, Dim);
for n = 1:N
    z(:,:)= plane(n,:,:);
    surface(x,y,z)
end
hold off

%% Calculate iluminance intensity

E0 = 1;
Ev = zeros(Dim,Dim);
e =  zeros(Dim,Dim);

p = d*tan(beta)+p0;

for n=1:N
    for i=1:Dim
        for j=1:Dim
            E = ((plane(n,i,j)+d)^m)*E0*(((x(i)+p*cos(2*pi*n/N))^2)+((y(j)+p*sin(2*pi*n/N))^2)+(plane(n,i,j)+d)^2)^(-(m+2)/2);
            Ev(i,j) = E;
            E=0;
        end
    end
    
    e = [e Ev];
end

% Normalização
e = real(e(:,Dim:(N+1)*Dim-1));
e=e/max(e,[],'all');
Ev = zeros(Dim,Dim);

%Plot
figure(3)
hold on
for n=1:N  
    Ev= Ev  + (e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1)));
    contour(x,y,(e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1))))
end        
hold off

figure(4)
contour(x,y,Ev)

figure(5)
surf(x,y,Ev)

figure(6)
plot(y,Ev(Dim/2,:))




