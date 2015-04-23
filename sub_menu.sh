#!/bin/bash
# Name: psi-teleport.sh
# Author: William Allen
# Description: This script executes a gcloud command that dumps a parsed list of Google Compute Engine instances into a file.
# It then reads that file as a list of servers to establish a SSH connection to.
# Upon selection of the desired server, a SSH connection is established.
#
# The server list may be updated by running the following command:
# gcloud compute instances list --sort-by NAME | tail -n +2 | awk '$6 != TERMINATED' | awk '{print $1, $4, $5}' | column -t | awk '{print "\t"NR")", "\t", $0}' > prodserver.list
#

while :
do
        clear

blk=$(tput setaf 0)
red=$(tput setaf 1)
grn=$(tput setaf 2)
yel=$(tput setaf 3)
blu=$(tput setaf 4)
mag=$(tput setaf 5)
cyn=$(tput setaf 6)
wht=$(tput setaf 7)
tbold=$(tput bold)
tnorm=$(tput sgr0)
trev=$(tput rev)
tab=$(tput cup 30 20)
count=$(cat ./prodserver.list | awk 'END { print NR }')



        cat<<EOF
${tbold}
${grn}
        ==================================================================
        =               ${yel}Google Compute Engine VM Instances${grn}               =
        ==================================================================
        =                       ${yel}GOOGLE PROJECT NAME${grn}                       =
        =                     ${yel}GOOGLE PROJECT ID${grn}                     =
        ==================================================================
        =        ${yel}Host                      Internal IP     External IP${grn}   =
        ==================================================================
${tnorm}
EOF

        #cat<<'EOF' ./prodserver.list
        cat<<'EOF' ./prodserver.list

EOF


# first prompt user for input
        read -p ''${tab}'  '${yel}'Select instance to connect to [1-'${count}']'${tnorm}'' uservar

        uvalue=$(cat ./prodserver.list | awk 'FNR == '$uservar' {print $3}')

        if [ $uservar -ge 1 -a $uservar -le ${count} ]; then
                ssh $uvalue;
                break
        fi
        echo  ${tab} ${red}"  Please select a value between [1-"${count}]"   ";

        sleep 2
done
