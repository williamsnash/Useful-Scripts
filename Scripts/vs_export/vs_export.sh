# echo "Setting preferences"
# cp settings.json C:/Users/nhqvvcq/AppData/Roaming/Code/User

#-----------------#COLOR CODES------------------#
NC='\033[0m' #No color
Black='\033[1;30m'        # Black
Red='\033[1;31m'          # Red
Green='\033[1;32m'        # Green
Yellow='\033[1;33m'       # Yellow
Blue='\033[1;34m'         # Blue
Purple='\033[1;35m'       # Purple
Cyan='\033[1;36m'         # Cyan
White='\033[1;37m'        # White
# Bold High Intensity
BIRed='\033[1;91m'        # Red
#-----------------------------------------------#

MENU=(
    "Export Extensions"
    "Export Settings"
    "Export Extensions and Settings"
)

#Creates print menu
echo "Pick option"
for ((i = 0; i < ${#MENU[@]}; i++))
do
    if [ "${MENU[$i]}" != "###" ]
    then
        echo -e "\t[ $((i+1)) ]: ${MENU[$i]}"
    else
        echo -e "\t-------------------------------------"
    fi
done
read -p "Selection: " userSelect

#Exits if no input is given
if [ -z $userSelect ]
then
    echo -e "${BIRed}No input given"
    echo -e "Exiting"
    exit
fi

#User choice functions
if [ $userSelect == 1 ]
then
    echo -e "${Cyan}${MENU[$((userSelect-1))]}${NC}" #Extensions
    code --list-extensions | xargs -L 1 echo code --install-extension > vs_extension.txt
    echo -e "${Green}Exporting Extensions Finished${NC}"
elif [ $userSelect == 2 ]
then
    echo -e "${Cyan}${MENU[$((userSelect-1))]}${NC}" #Settings
    cat C:/Users/nhqvvcq/AppData/Roaming/Code/User/settings.json > settings.json
    echo -e "${Green}Export Settings Finished${NC}"
elif [ $userSelect == 3 ]
then
    echo -e "${Cyan}${MENU[$((userSelect-1))]}${NC}" #Both
    
    echo "Starting export of extensions"
    code --list-extensions | xargs -L 1 echo code --install-extension > vs_extension.txt
    echo -e "\t${Green}Exporting Extensions Finished${NC}"
    echo "Starting export of settings"
    cat C:/Users/nhqvvcq/AppData/Roaming/Code/User/settings.json > settings.json
    echo -e "\t${Green}Export Settings Finished${NC}"
    echo -e "${Cyan}Starting creation of install and format script${NC}"
    #---------
    cat vs_extension.txt > vs_install.sh
    echo -e "${Blue}Creating...${NC}"
    sleep 0.5
    echo -e "${Blue}Creating...${NC}"
    sleep 0.5
    file=`cat settings.json`
    echo "echo '$file' > C:/Users/nhqvvcq/AppData/Roaming/Code/User/settings.json" >> vs_install.sh
    # echo "cp settings.json C:/Users/nhqvvcq/AppData/Roaming/Code/User" >> vs_install.sh
    echo -e "${Blue}Creating...${NC}"
    echo -e "${Green}Create Complete${NC}"
    echo "Setup Scipt created"
    echo "Run script using ./vs_install.sh"
fi