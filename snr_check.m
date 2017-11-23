% Function
%   Check SNR ratio

function snr = snr_check(x, y)
    % Length of signal
    n = length(x);
    
    Esym0 = sum(abs(x).^2)/(n);
    noise = y - x;
    
    Esym1 = sum(abs(noise).^2)/(n);
    
    snr = 10 * log10(Esym0/Esym1);
end