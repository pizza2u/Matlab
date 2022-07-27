clear all, clc

% A leitura de um sinal por meio de Matlab é feita por:
% [sinal,Fs] = audioread('C:\sinal.wav');
%% Leitura do Sinal 1:

[y,Fs] = audioread('sinal 1.wav')
plot(y)
title('Sinal: 1')

xlabel('Tempo')
ylabel('Ampliture')

%% Leitura do Sinal 2:

[y,Fs] = audioread('sinal 2.wav')
plot(y)

title('Sinal: 2')
xlabel('Tempo')
ylabel('Ampliture')

%% Transformada de Fourier no sinal 1:

[sinal1,Fs] = audioread('sinal 1.wav');
L = lenght(sinal1);
NFFT = 2^nextpow2(L);
X = fft(sinal1,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
figure(2)
plot(y)
plot(f,2*abs(X(1:NFFT/2+1)))
title('Sinal: 1')

xlabel('Frequencia[Hz]')
ylabel('|X(f)|')


%% %% Transformada de Fourier no sinal 2:

[sinal2,Fs] = audioread('sinal 2.wav');
L = lenght(sinal2);
NFFT = 2^nextpow2(L);
X = fft(sinal2,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
figure(3)
plot(y)
plot(f,2*abs(X(1:NFFT/2+1)))
title('Sinal: 2')

xlabel('Frequencia[Hz]')
ylabel('|X(f)|')