#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]
then
    curl -L0 https://www.github.com/tm-ahad/cream/releases/download/v0.1.0-linux-alpha/cream -o ./cream
elif [[ "$OSTYPE" == "darwin"* ]]
then
    curl -L0 https://www.github.com/tm-ahad/cream/releases/download/v0.1.0-darwin/cream -o ./cream
fi
sudo chmod 777 ./cream
sudo mv ./cream /usr/bin/cream
echo -e "\e[1;32mCream has successfully installed on your machine.\e[0m"

