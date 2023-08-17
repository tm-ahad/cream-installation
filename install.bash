if [[ "$OSTYPE" == "linux-gnu" ]]
then
    curl -L0 https://www.github.com/tm-ahad/cream/releases/download/v0.1.0-linux-alpha/cream -o ./cream
    sudo chmod 777 ./cream
    sudo mv ./cream /usr/bin/cream
elif [[ "$OSTYPE" == "darwin"* ]]
then
    curl -L0 https://www.github.com/tm-ahad/cream/releases/download/v0.1.0-darwin/cream -o ./cream
    sudo chmod 777 ./cream
    sudo mv ./cream /usr/local/bin/cream
fi

echo "Cream has successfully installed on your machine."

