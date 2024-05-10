#!/bin/bash

if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Please install curl before running this script."
    exit 1
fi

echo "Fetching latest Cream release information..."
LATEST_RELEASE=$(curl -sL https://api.github.com/repos/tm-ahad/cream/releases/latest)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt install jq
    DOWNLOAD_URL=$(echo "$LATEST_RELEASE" | jq -r '.assets[] | select(.name | contains("cream-linux")) | .browser_download_url')
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install jq
    DOWNLOAD_URL=$(echo "$LATEST_RELEASE" | jq -r '.assets[] | select(.name | contains("cream-darwin")) | .browser_download_url')
else
    echo "Cannot run this script on systems other than darwin or linux-gnu."
    exit 1 
fi

if [[ -z "$DOWNLOAD_URL" ]]; then
  echo "Error: Could not find download URL for Cream in the latest release."
  exit 1
fi


if [[ "$OSTYPE" == "linux-gnu" ]]
then
    curl -L0 https://github.com/tm-ahad/cream/releases/download/v0.4.2-alpha/linux -o ./cream
    sudo chmod 755 ./cream
    sudo mv ./cream /usr/bin/cream
elif [[ "$OSTYPE" == "darwin"* ]]
then
    curl -L0 https://github.com/tm-ahad/cream/releases/download/v0.4.2-alpha/darwin -o ./cream
    sudo chmod 755 ./cream
    sudo mv ./cream /usr/local/bin/cream
fi