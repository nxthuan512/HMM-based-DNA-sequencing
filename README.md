In this project, a HMM-based DNA sequencing code was implemented in Matlab. The DNA sequence is randomly generated and stored in a text file. The Matlab code reads the sequence, adds noise, and then performs HMM to recover the original sequence.

List of files
  1) generateDNASeq: generate a random 100-base DNA sequence
  2) dnaSeq2Digit: convert the DNA's bases into binary value (e.g. A = 00, C = 01, G = 10, T = 11)
  3) addNoise: insert Gaussian noise with a defined SNR value
  4) sensorSimulator: the sensor simulation value
