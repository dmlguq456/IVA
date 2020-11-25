% Performing Blind Source Separation using Independent Vector Analysis(IVA)

[x, Fs] = audioread('x_2x2_instant.wav');

% Parameters
MaxIter       = 200;
step_size     = 0.1;

y = ICA(x, MaxIter, step_size);

figure;
spectrogram(y(1,:),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);
figure;
spectrogram(y(2,:),512,384,512,Fs,'yaxis');colormap jet;caxis([-140  -30]);

audiowrite('source1_IVA.wav',y(1,:),Fs);
audiowrite('source2_IVA.wav',y(2,:),Fs);
