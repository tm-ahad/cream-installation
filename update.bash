if [[ "$OSTYPE" == "linux-gnu" ]]
then
    curl -L0 https://github.com/tm-ahad/cream/releases/download/v0.4.2-alpha/linux -o ./cream
    sudo chmod 777 ./cream
    sudo mv ./cream /usr/bin/cream
elif [[ "$OSTYPE" == "darwin"* ]]
then
    curl -L0 https://github.com/tm-ahad/cream/releases/download/v0.4.2-alpha/darwin -o ./cream
    sudo chmod 777 ./cream
    sudo mv ./cream /usr/local/bin/cream
elif [[ "$OSTYPE" == "msys" ]]
then
    curl -L0 https://www.github.com/tm-ahad/cream/releases/download/v0.4.2-alpha/windows.exe -o ./cream.exe

    CH=$HOME/.cream
    BASHRC=$HOME/.bashrc
    PASS=""

    if [[ -d $CH ]]
    then
        $PASS
    else
        mkdir $CH
    fi

    mv ./cream.exe $CH/cream.exe

    if [[ ! -f $BASHRC ]]
    then
        touch $BASHRC
    fi
fi

echo "Cream has been successfully updated on your machine."
