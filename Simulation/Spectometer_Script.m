
filenames = ["Datas/SEM_FILTRO_ASEQ.txt","Datas/SEM FILTRO_ESPEC2.txt","Datas/FILTRO_LED_ASEQ.txt","Datas/FILTRO_LED.txt","Datas/FILTRO_ESPECTROMETRO_ASEQ.txt","Datas/FILTRO_ESPECTROMETRO.txt"];

Intensity=zeros(size(filenames,2),3648);
Spectral=zeros(size(filenames,2),3648);


for i=1:size(filenames,2)
        fileID = fopen(filenames(i));
        C = textscan(fileID,"%s %s");
        fclose(fileID);

        Intensity(i,:) = transpose(str2double(C{1,2}(1:3648)));
        Intensity(i,:) = Intensity(i,:)/max(Intensity(i,:));
        Spectral(i,:) = transpose(str2double(C{1,1}(1:3648)));
        
        
end

figure(1)
plot(Spectral(1,:),Intensity(1,:),Spectral(2,:),Intensity(2,:),Spectral(3,:),Intensity(3,:),Spectral(4,:),Intensity(4,:),Spectral(5,:),Intensity(5,:),Spectral(6,:),Intensity(6,:))
legend(["SEM FILTRO ASEQ","SEM FILTRO","FILTRO LED ASEQ","FILTRO LED","FILTRO ESPECTROMETRO ASEQ","FILTRO ESPECTROMETRO"])
title('Dados Espectroscopia')
xlabel('Comprimento de Onda(nm)')

