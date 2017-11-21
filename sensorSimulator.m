function sensorSimulator
    % Generate a random DNA sequence
    DNASeqLen = 100;    % Number of bases
    DNASeq = generateDNASeq(DNASeqLen);
  
    % Convert DNA to digital signal
    K = 3; % K-mer
    digitSignal = dnaSeq2Digit(DNASeq, K);
    
    % Add noise
    snr = 30;
    rawSensor = addNoise(digitSignal, snr);
    
    % Plot the signal
    t = (1: 1: DNASeqLen);
    plot(t, [digitSignal; rawSensor]);
    legend('Raw signal',['Raw signal with SNR=' num2str(snr)]);
end