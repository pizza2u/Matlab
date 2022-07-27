%% Filtragem de um sinal

%% FILTRO FIR
H = [-2.2097e-05; -0.00090689; 2.6651e-05; 0.0012397; -3.5583e-05; -0.0018037;4.865e-05; 0.0026359; -6.5483e-05;
    -0.0037794; 8.5604e-05; 0.005287; -0.00010846; -0.0072278; 0.00013344; 0.0096989; -0.00015995; -0.012846;0.0001875; 
    0.016904; -0.00021576; -0.022282; 0.00024485; 0.029756;-0.00027585; -0.041007; 
    0.00031228;0.06043; -0.00036613; -0.10419;0.0004996; 0.3181; 0.5; 0.31751; 3.576e-06;
    -0.10417; -0.00012438;0.06045; 0.00015789; -0.041037; -0.00016692; 0.029789; 
    0.00016442;-0.022315; -0.00015513; 0.016936; 0.0001415; -0.012876; -0.00012517; 
    0.0097256; 0.00010741; -0.0072513; -8.93e-05; 0.005307; 7.1811e-05; -0.0037959;
    -5.5796e-05; 0.0026488; 4.2002e-05; -0.001813; -3.1059e-05;0.0012457; 
    2.3461e-05; -0.00090977; -1.9565e-05; 0.00077182; 1.9574e-05];
% Para o sinal 2:
stem(H);
Fs = 22050;
L=length(H);
NFFT = 2^nextpow2(L);X= fft(H,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
figure(4);
plot(f,2*abs(X(1:NFFT/2+1)))
title('Sinal: 2')
xlabel('Frequ�ncia[Hz]')
ylabel('|X(f)|')

%% Filtragem na frequ�ncia

H = [-2.2097e-05; -0.00090689; 2.6651e-05; 0.0012397; -3.5583e-05; -0.0018037;4.865e-05; 0.0026359; -6.5483e-05;
    -0.0037794; 8.5604e-05; 0.005287; -0.00010846; -0.0072278; 0.00013344; 0.0096989; -0.00015995; -0.012846;0.0001875; 
    0.016904; -0.00021576; -0.022282; 0.00024485; 0.029756;-0.00027585; -0.041007; 
    0.00031228;0.06043; -0.00036613; -0.10419;0.0004996; 0.3181; 0.5; 0.31751; 3.576e-06;
    -0.10417; -0.00012438;0.06045; 0.00015789; -0.041037; -0.00016692; 0.029789; 
    0.00016442;-0.022315; -0.00015513; 0.016936; 0.0001415; -0.012876; -0.00012517; 
    0.0097256; 0.00010741; -0.0072513; -8.93e-05; 0.005307; 7.1811e-05; -0.0037959;
    -5.5796e-05; 0.0026488; 4.2002e-05; -0.001813; -3.1059e-05;0.0012457; 
    2.3461e-05; -0.00090977; -1.9565e-05; 0.00077182; 1.9574e-05];

[sinal2,Fs] = audioread('sinal 2.wav');
H = [H; zeros(110249,1)];
sinal2 = [sinal2; zeros(66,1)];
L1=length(H);
NFFT = 2^nextpow2(L1);
X1= fft(H,NFFT)/L1;
f1 = Fs/2*linspace(0,1,NFFT/2+1);
L2=length(sinal2);
NFFT = 2^nextpow2(L2);
X2= fft(sinal2,NFFT)/L2;
f2 = Fs/2*linspace(0,1,NFFT/2+1);
Z = X1.*X2;
f = Fs/2*linspace(0,1,NFFT/2+1);
figure(3)
plot(f,2*abs(Z(1:NFFT/2+1)))
title('Sinal filtrado na frequ�ncia');
xlabel('Frequ�ncia(Hz)')
ylabel('|M�dulo|')