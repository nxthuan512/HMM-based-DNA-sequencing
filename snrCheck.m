% =========================================================================
% Function:
%   Check SNR value
%       Input:  signal vector, (signal + noise) vector
%       Output: SNR value
% =========================================================================
function snr = snrCheck(x, y)
    % Length of signal
    n = length(x);
    
    Esym0 = sum(abs(x).^2)/(n);
    noise = y - x;
    
    Esym1 = sum(abs(noise).^2)/(n);
    
    snr = 10 * log10(Esym0/Esym1);
end