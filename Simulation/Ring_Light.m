
Alt_Cam = 2.6;
Raio_Ar = 3;


theta = 30;

m = (-log(2))/log(cos(deg2rad(theta/2)));

N=10;
Dim = 100;

z = 1;
p = 1;



x = linspace(-2,2,Dim);
y = linspace(-2,2,Dim);


E0 = 1;

Ev = zeros(Dim,Dim);

e =  zeros(Dim,Dim);

for n=1:N
    for i=1:Dim
        for j=1:Dim
            E = (z^m)*E0*(((x(i)-p*cos(2*pi*n/N))^2)+((y(j)-p*sin(2*pi*n/N))^2)+z^2)^(-(m+2)/2);
            Ev(i,j) = E;
            E=0;
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
    
    contour(x,y,(e(:,n+(n-1)*(Dim-1):(n+(Dim-1))+(n-1)*(Dim-1))))
           
    
end

hold off

figure(2)
contour(x,y,Ev)

figure(3)
surf(x,y,Ev)

figure(4)
plot(y,Ev(Dim/2,:))








            
