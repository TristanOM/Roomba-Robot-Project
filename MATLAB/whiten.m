function whitenAA = whiten(a) 
%Function to whiten images
X = a;
mX = bsxfun(@minus,double(X),mean(X)); %remove mean
fX = fft(fft(mX,[],2),[],3); %fourier transform of the images
spectr = sqrt(mean(abs(fX).^2)); %Mean spectrum
whitenAA = ifft(ifft(bsxfun(@times,fX,1./spectr),[],2),[],3); %whitened X
whitenAA = imcomplement(whitenAA);

end

