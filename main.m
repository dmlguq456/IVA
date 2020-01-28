% Performing Blind Source Separation using Independent Vector Analysis(IVA)

[x, Fs] = audioread('x_2x2_S1.wav');

% Parameters
Nfft          = 2048;
MaxIter       = 200;
step_size     = 0.1;

Y = IVA(x, Nfft, MaxIter, step_size);

figure;
spectrogram(Y(:,1),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
figure;
spectrogram(Y(:,2),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);

audiowrite('source1_IVA.wav',Y(:,1),Fs);
audiowrite('source2_IVA.wav',Y(:,2),Fs);
