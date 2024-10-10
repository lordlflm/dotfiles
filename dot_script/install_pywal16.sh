#!/bin/bash

echo "Installing pywal16..."
pipx install pywal16
pip install haishoku --break-system-packages
pipx inject pywal16 haishoku
pip install colorz --break-system-packages
pipx inject pywal16 colorz
pip install fast_colorthief --break-system-packages
pipx inject pywal16 fast_colorthief
pip install colorthief --break-system-packages
pipx inject pywal16 colorthief
pip install modern_colorthief --break-system-packages
pipx inject pywal16 modern_colorthief
pipx ensurepath
echo "Done."
