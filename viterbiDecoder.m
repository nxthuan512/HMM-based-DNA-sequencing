% =========================================================================
% Function:
%   Check the quality of HMM-based base calling algorithm
%       Input:  Signal vector, (Signal + Noise) vector
%       Output: Base quality
% =========================================================================

function dSRecovery = viterbiDecoder(dnaSeqLen, dSN)
    % Triplet DNA vector
    maxTri = 64;
    tri = 1 : 1 : maxTri;
    % Transition probability A
    a = ones(1, dnaSeqLen);
    
    % Emission probability B, sigma^2 = 1 simplest case
    %sigma = var(dSN);
    sigma = 1;
    b = 1./( sqrt(2*pi*sigma) * exp(((dSN(1) - tri).^2))/sigma);
    % Previous forward path probability from the previous time step
    x = b; % x = a * b
    % Viterbi path, recovery digital signal
    dSRecovery = zeros(1, dnaSeqLen);
    
    % fo = fopen('check.txt','w');      % --- Simulation only ---
    
    % Iteration
    for k = 2 : dnaSeqLen
        % Run each state
        b = 1./( sqrt(2*pi*sigma) * exp(((dSN(k) - tri).^2))/sigma);
        for i = 1 : maxTri
            % Find 4 previous forward path probability
            % Ex: if current value is AAA -> previous value are AAA, CAA, GAA, TAA
            for j = 0 : 3
                tmp = round((j * 16) + (i - 1)/4);
                x(i) = max(x(i), a(tmp + 1));
            end
            % Get max forward path probability
            x(i) = x(i) * 0.25 * b(i);    % 0.25: transition probability
        end
        [tmp, dSRecovery(k)] = max(x);
        
        %fprintf(fo, '%1.3f ', x);  % --- Simulation only ---
        %fprintf(fo, '\n');         % --- Simulation only ---
    end
    %fclose(fo);        % --- Simulation only ---
end