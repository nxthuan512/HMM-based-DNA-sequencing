% =========================================================================
% Function:
%   Generate a simulated DNA sequence, convert it into digital signal, add
%   noise, and use HMM-based base calling to recover.
% =========================================================================
function testSystem()

    % SNR value
    SNR = 5 : 1 : 30;
    nSNR = length(SNR);
    bcQuality = zeros(1, nSNR);
    
    for i = 1 : nSNR
        % Generate the sensor signal
        [dnaSeq, dSN] = sensorSimulator(SNR(i));
        dnaSeqLen = length(dSN);

        % Perform base calling
        bcQuality(i) = baseCaller(dnaSeqLen, dnaSeq, dSN);
    end
    
    semilogy(SNR, bcQuality);
    grid on
    xlabel('SNR Value (dB)');
    xlim([min(SNR), max(SNR)]);
    set(gca, 'XTick', min(SNR) : 1 : max(SNR));
    
    ylabel('Base Error Rate');    
    legend('Base Error');
end