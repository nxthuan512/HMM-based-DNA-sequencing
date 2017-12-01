% =========================================================================
% Function:
%   Convert a DNA sequence into a digital signal with K-mer (K = 3)
% =========================================================================
function digitSignal = dnaSeq2Digit(dnaSeq)
    % Initialize digital signal
    n = length(dnaSeq);
    digitDNASeq = zeros(1, n);
       
    % Assign each base a number
    % A = 00; C = 01; G = 10; T = 11
    for i = 1 : n
        if dnaSeq(i) == 'A'
            digitDNASeq(i) = 0;
        elseif dnaSeq(i) == 'C'
            digitDNASeq(i) = 1;
        elseif dnaSeq(i) == 'G'
            digitDNASeq(i) = 2;
        else
            digitDNASeq(i) = 3;
        end
    end
    
    % LUT of K-mer
    %offset = 150; % pA
    offset = 0; % pA
    digitSignal = zeros(1, n-2);
    for i = 3 : n
        digitSignal(i-2) = offset + bitsll(digitDNASeq(i-2), 4) + bitsll(digitDNASeq(i-1), 2) + digitDNASeq(i);
    end

end