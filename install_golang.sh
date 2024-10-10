#!/bin/sh

GO_VERSION="1.23.2"

echo "Installing Golang..."
wget https://go.dev/dl/go${GO_VERSION}.src.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm go${GO_VERSION}.src.tar.gz
echo "Done."
