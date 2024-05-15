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

echo $DOWNLOAD_URL

if [[ -z "$DOWNLOAD_URL" ]]; then
  echo "Error: Could not find download URL for Cream in the latest release."
  exit 1
fi

curl -L0 $DOWNLOAD_URL -o ./cream
sudo chmod 755 ./cream

if [[ "$OSTYPE" == "linux-gnu" ]]
then
    sudo mv ./cream /usr/bin
elif [[ "$OSTYPE" == "darwin"* ]]
then
    sudo mv ./cream /usr/local/bin
fi

echo "Cream is successfully installed on your machine."