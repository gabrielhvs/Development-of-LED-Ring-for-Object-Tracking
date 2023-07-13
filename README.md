# Desenvolvimento de Anel de Leds para Rastreamento de Objetos


### Parâmetros para escolha de um anel de LED


[Configurable and Powerful Ring Lights for machine vision](https://www.effilux.com/en/products/ring/effi-ring#optical)


### Diferença entre LED’s de 850 e 940nm


[850nm vs 940nm. Which infrared wavelength is better?](https://nightfoxstore.com/blogs/news/850nm-vs-940nm-which-infrared-wavelength-is-better)


[850nm vs. 940nm Infra-Red Lighting - Raytec](https://www.raytecled.com/850nm-vs-940nm-infra-red-lighting/)


## Uniformidade na Iluminação


[](https://github.com/gabrielhvs/Estagio_Supervisionado/blob/master/Ring_Light/Papers/Analysis_of_condition_for_uniform_lighting_generat.pdf)


[](https://github.com/gabrielhvs/Estagio_Supervisionado/blob/master/Ring_Light/Papers/ApplOpt2006.pdf)


[](https://github.com/gabrielhvs/Estagio_Supervisionado/blob/master/Ring_Light/Papers/1-s2.0-S0030402617304400-main.pdf)


### Simulação


- **Anel de Led**


![Untitled](images/Untitled.png)


- Dados
   
    Distância(z) = 1m
   
    N. Leds = 10
   
    Angle view = 30
   
- Arena 4 Anéis de LED’s
   
    ![Screenshot from 2023-04-17 13-18-02.png](images/Screenshot_from_2023-04-17_13-18-02.png)
   


A imagem acima é correspondente a iluminação da arena provida pelos 4 anéis de LED quando estes estão com o raio de melhor distribuição (r = 1.1971)


![Screenshot from 2023-04-17 13-37-55.png](images/Screenshot_from_2023-04-17_13-37-55.png)


A imagem acima é correspondente a iluminação da arena provida pelos 4 anéis de LED quando estes estão com o raio atual (r = 0.03)


## Espectometro


- Uso de dois espectrômetros (ASEQ - OCEAN)
    - Experimentos de varredura de frequência
       
        Sem filtro
       
        Com filtro de 850nm - próximo a fonte
       
        Com filtro de 850nm - próximo ao sensor
       
   
    ![Untitled](images/Untitled%201.png)
   
- É perceptível que a faixa de operação do Led  é estreita quando mesmo quando usada sem filtro.
- Já com o filtro a faixa fica ainda mais estreita (Pode ser aproximado por um impulso!)


## Inclusão do  ngulo Beta


Os led não precisam estar necessariamente a 90 graus do plano do anel, eles podem apresentar ângulos maiores ou menores a depender da necessidade.


-  ngulos maiores aumentam o raio final do anel no plano de atuação, em contrapartida diminui a concentração de luminosidade no centro.
-  ngulos menores diminuem o raio final do anel no plano de atuação, intensificando assim a luminosidade no centro.


![Untitled](images/Untitled%202.png)


- Na imagem acima o ângulo de atuação foi aumentado fazendo com que a distribuição fosse mais uniforme, mesmo com um raio do anel pequeno.
- Para tal foram criados planos de atuação para cada um dos leds, neste exemplo o anel era composto apenas por quatro leds.


![Untitled](images/Untitled%203.png)


### Fornecedores e Datasheets


[](https://docs.rs-online.com/6c0c/0900766b81121e5e.pdf)


[](https://docs.rs-online.com/d7e2/0900766b80e1b0e4.pdf)


[](https://www.mouser.com/datasheet/2/216/AA4040SF4BT_P22-2891735.pdf)


[](https://www.mouser.com/datasheet/2/414/TTRB_S_A0010459733_1-2565676.pdf)


[](https://www.mouser.com/datasheet/2/1094/MTE0013_995_IR-2237734.pdf)


[](https://www.mouser.com/datasheet/2/414/OPTIS01176_1-2564856.pdf)


[](https://www.mouser.com/datasheet/2/414/OPTIS01176_1-2564856.pdf)


[](https://chromeled.com/pdf/smd/subminiature/CSM28IR940CZ.pdf)


