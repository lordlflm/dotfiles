#!/bin/sh

echo "Installing Golang..."
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.2.linux-amd64.tar.gz
echo "Done."
