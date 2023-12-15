if [[ "$OSTYPE" == "linux-gnu" ]]
then
    sudo rm /usr/bin/cream
elif [[ "$OSTYPE" == "darwin"* ]]
then
    sudo rm /usr/local/bin/cream
elif [[ "$OSTYPE" == "msys" ]]
then
    rm $HOME/.cream
fi

echo "Cream has been successfully removed from your machine chine."
