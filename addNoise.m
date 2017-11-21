function rawSensor = addNoise(tinyDigitSignal, snr)
    rawSensor = awgn(tinyDigitSignal, snr, 'measured');
end