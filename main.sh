#!/bin/bash

# clear the screen
tty -s && tput clear

# tput cup 1 2 Move cursor to screen location X,Y (top left is 0,0)

tty -s && tput setaf 3 # Set a foreground colour using ANSI escape
tty -s && tput cup 3 21
echo "Jumpbox!"
tty -s && tput sgr0 #reset all settings

tput rev # Set reverse video mode
tput cup 5 17
echo " J U M P - M E N U "
tput sgr0

printf "\n"

tput cup 8 15
echo "1. OPTION 1"

tput cup 9 15
echo "2. OPTION 2"

tput cup 10 15
echo "3. OPTION 3"

tput cup 11 15
echo "4. OPTION 4"

tput bold # Set bold mode

tput cup 13 15
while true
do
# first prompt user for input
read -p 'Select instance environment [1-4]' uservar

# then handle input given
        case $uservar in
                1 ) /bin/bash ./sub_menu; exit;;
                2 ) echo "The tunnel for environment $uservar isn't done yet!";;
                3 ) echo "The tunnel for environment $uservar isn't done yet!";;
                4 ) echo "The tunnel for environment $uservar isn't done yet!";;
        * ) echo "Please select a value between 1-4.";;
        esac
done
#tput clear
tput sgr0
tput rc
