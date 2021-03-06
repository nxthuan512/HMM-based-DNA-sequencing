function sensorSimulator(SNR)
    % Generate a random DNA sequence
    % DNASeqLen = 100;    % Number of bases
    % DNASeq = generateDNASeq(DNASeqLen);
    
    DNASeq = 'CATCCCTCACCTGAAGTGTCCAGCAAATACACCAAGGGTGACGCAGGACAAGCATGAGCCATTCATACTGCTGCAACCAGAGAGAGGGAGCAGGAAAAT';
    DNASeqLen = length(DNASeq);
    
    % Convert DNA to digital signal
    K = 3; % K-mer
    digitSignal = dnaSeq2Digit(DNASeq, K);
    
    % Add noise
    rawSensor = addNoise(digitSignal, SNR);
    
    % Plot the signal
    t = (1: 1: DNASeqLen);
    plot(t, [digitSignal; rawSensor]);
    grid on
    xlabel('State Index');
    ylabel('Current (pA)');
    legend('Raw signal',['Raw signal with SNR=' num2str(SNR)]);
end