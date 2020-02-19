% Performing Blind Source Separation using Independent Vector Analysis(IVA)
path = '../../OneDrive/Graduate/Lab/GNU_AI/dataset/mixture_Long_FMF_3x3_RT_0.13/';
[x, Fs] = audioread([path,'x_3x3_S7.wav']);

% Parameters
Nfft          = 2048;
MaxIter       = 300;
step_size     = 0.1;

Y = IVA(x, Nfft, MaxIter, step_size);
Y_AUX = AUXIVA(x, Nfft, 0, 100);


figure;
subplot(2,3,1);
spectrogram(Y(:,1),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
subplot(2,3,2);
spectrogram(Y(:,2),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
subplot(2,3,3);
spectrogram(Y(:,3),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
subplot(2,3,4);
spectrogram(Y_AUX(:,1),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
subplot(2,3,5);
spectrogram(Y_AUX(:,2),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
subplot(2,3,6);
spectrogram(Y_AUX(:,3),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);

% audiowrite('source1_IVA.wav',Y(:,1),Fs);
% audiowrite('source2_IVA.wav',Y(:,2),Fs);
