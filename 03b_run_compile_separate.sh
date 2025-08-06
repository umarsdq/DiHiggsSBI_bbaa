#!/bin/bash

# Script to run separate compilation for signal and background components
# This handles the different batch structures for signal_sm (10 batches) and signal_bsm (5 batches each)

eval "$(/home/hep/us322/miniforge3/bin/conda shell.bash hook)"
conda activate madminer_env

echo "Running separate compilation for different components..."

# Compile SM signal (10 batches)
echo "Compiling SM signal (10 batches)..."
python 03b_compile_separate.py -p signal_sm

# Compile BSM signal (5 batches each for 9 morphing basis vectors)
echo "Compiling BSM signal (5 batches each for 9 morphing basis vectors)..."
python 03b_compile_separate.py -p signal_bsm

# Compile all signal (SM + BSM)
echo "Compiling all signal (SM + BSM)..."
python 03b_compile_separate.py -p signal_all

# Compile background (80 batches)
echo "Compiling background (80 batches)..."
python 03b_compile_separate.py -p background -n 80

echo "Compilation complete!"
echo "Output files:"
echo "  - delphes_signal_sm_shuffled_100TeV.h5 (SM signal only)"
echo "  - delphes_signal_bsm_shuffled_100TeV.h5 (BSM signal only)"
echo "  - delphes_s_shuffled_100TeV.h5 (All signal: SM + BSM)"
echo "  - delphes_b0_shuffled_100TeV.h5 (Background)" 