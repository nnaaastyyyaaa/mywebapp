#!/bin/bash
echo  "Creating a folder..."
$ mkdir actions-runner && cd actions-runner# Download the latest runner package

echo "Downloading the latest runner package"
$ curl -o actions-runner-osx-x64-2.334.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.334.0/actions-runner-osx-x64-2.334.0.tar.gz

echo "Validating the hash..."
$ echo "73a979ff7e9ce8a70244f3a959d896870be486fac92bb08ed90684f961474e0d  actions-runner-osx-x64-2.334.0.tar.gz" | shasum -a 256 -c

echo "Extracting the installer"
$ tar xzf ./actions-runner-osx-x64-2.334.0.tar.gz

echo ""
echo "Runner files installed successfully!!!"
echo "Next step:"
echo "./config.sh --url REPOSITORY_URL --token TEMP_TOKEN"
echo "Finally:"
echo "./run.sh"