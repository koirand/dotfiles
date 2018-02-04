askYesOrNo() {
    while true ; do
        read -p "$1 [Y/n]: " answer
        case $answer in
            ""                  ) return 0;;
            [yY] | [yY]es | YES ) return 0;;
            [nN] | [nN]o | NO   ) return 1;;
            *                   ) echo "Please answer yes or no.";;
        esac
    done
}

askYesOrNo "Do you want to continue?"

if [ $? -eq 0 ]; then
    echo "Yes"
else
    echo "no"
fi

