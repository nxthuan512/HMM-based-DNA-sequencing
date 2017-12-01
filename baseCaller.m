% =========================================================================
% Function:
%   Generate a simulated DNA sequence, convert it into digital signal, add
%   noise, and use HMM-based base calling to recover.
% =========================================================================
function ber = baseCaller(dnaSeqLen, dnaSeq, dSN)

    % Perform Viterbi encoding
    dSRecovery = viterbiDecoder(dnaSeqLen, dSN);
    
    % Convert all states into DNA sequence
    dnaSeqRecovery = digit2dnaSeq(dSRecovery);

    % Calculate base error ration
    ber = ((sum(dnaSeq ~= dnaSeqRecovery)) / length(dnaSeq)) * 100;
end