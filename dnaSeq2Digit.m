% Convert digital to analog
function digitSignal = dnaSeq2Digit(DNASeq, K)
    % Initialize digital signal
    n = length(DNASeq);
    digitDNASeq = zeros(1, n);
    digitSignal = zeros(1, n);
    
    % Assign each base a number
    % A = 00; C = 01; G = 10; T = 11
    for i = 1 : n
        if DNASeq(i) == 'A'
            digitDNASeq(i) = 0;
        elseif DNASeq(i) == 'C'
            digitDNASeq(i) = 1;
        elseif DNASeq(i) == 'G'
            digitDNASeq(i) = 2;
        else
            digitDNASeq(i) = 3;
        end
    end
    
    % Add K bases to the beginning of DNASeq and K bases to the end of
    % DNASeq
    prefix = zeros(1, K);
    suffix = zeros(1, K);
    for i = 1 : K
        prefix(i) = digitDNASeq(1);
        suffix(i) = digitDNASeq(n);
    end
    digitDNASeq = [prefix digitDNASeq suffix];
    
    % LUT of K-mer
    j = 3;
    offset = 150; % pA
    for i = 1 : n
        digitSignal(i) = offset + bitsll(digitDNASeq(j-2), 4) + bitsll(digitDNASeq(j-1), 2) + digitDNASeq(j);
        j = j + 1;
    end

end