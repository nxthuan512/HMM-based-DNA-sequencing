% =========================================================================
% Function:
%   Create a simulated sensor signal with a given SNR value
%       Input:  SNR value and DNA sequence length
%       Output: (Signal + Noise) signal 
% =========================================================================

function [dnaSeq, digitSignalNoise] = sensorSimulator(SNR)
    % Generate a random DNA sequence
    % DNASeq = generateDNASeq(dnaSeqLen);
    
    dnaSeq = 'CATCCCTCACCTGAAGTGTCCAGCAAATACACCAAGGGTGACGCAGGACAAGCATGAGCCATTCATACTGCTGCAACCAGAGAGAGGGAGCAGGAAAATA';
    
    % Convert DNA to digital signal
    K = 3; % K-mer
    digitSignal = dnaSeq2Digit(dnaSeq);
    dnaSeqLen = length(digitSignal);
    
    % Add noise
    digitSignalNoise = noiseAdd(digitSignal, SNR);
    
    % Plot the signal
    t = (1: 1: dnaSeqLen);
    plot(t, [digitSignal; digitSignalNoise]);
    %axis([0 100 0 300])
%     grid on                       % --- Simulation only ---
%     xlabel('State Index');        % --- Simulation only ---
%     ylabel('Current (pA)');       % --- Simulation only ---
%     legend('Raw signal',['Raw signal with SNR=' num2str(SNR), ' dB']);    % --- Simulation only ---
    
    % Recheck the SNR
    % snr = snrCheck(digitSignal, digitSignalNoise);        % --- Simulation only ---
    % disp(['Recheck SNR value: ', num2str(snr), ' dB']);   % --- Simulation only ---
    
end
