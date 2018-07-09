function PSNR = psnr(I, I_noisy)

I_max = max(max(I));
I_min = min(min(I));

A = I_max - I_min;

PSNR = 10 * log10((double(A)^2) / (std2(I - I_noisy)^2));

end

