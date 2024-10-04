#!/bin/bash

echo "Downloading Ghidra..."
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.2_build/ghidra_11.2_PUBLIC_20240926.zip -O ~/src/ghidra_11.2.zip

echo "Unziping..."
unzip ~/src/ghidra_11.2.zip

rm -rf ~/src/ghidra_11.2.zip

echo "Done."
