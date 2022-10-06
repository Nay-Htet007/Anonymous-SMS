#data/data/com.termux/files/usr/bin/bash

clear

#Color Variable

gre='\e[0;32m'

green='\e[1;32m'

yellow='\e[1;33m'

close='\e[0m'

loading () {

echo -e $gre

echo -ne '#####                     (33%)\r'

sleep 1

echo -ne '#############             (66%)\r'

sleep 1

echo -ne '#######################   (100%)\r'

echo -ne '\n'

echo -e $close

}

command -v wget > /dev/null  && wget=true || wget=false

if [[ $wget == true ]];then

sleep 2

echo

echo -e $yellow "-$green You have already installed wget.$close"

echo

else

pkg install wget -y > /dev/null 2>&1 &

echo -e $yellow "    Now$green wget$yellow Installing...."

sleep 3

echo -e $yellow "    Just wait a minute...."

sleep 3

loading

echo -e $green "    You have just installed wget."$close

fi

command -v curl > /dev/null  && curl=true || curl=false

if [[ $curl == true ]];then

sleep 2

echo

echo -e $yellow "-$green You have already installed curl.$close"

echo

else

pkg install curl -y > /dev/null 2>&1 &

echo -e $yellow "    Now$green curl$yellow Installing...."

sleep 3

echo -e $yellow "    Just wait a minute...."

sleep 3

loading

echo -e $green "    You have just installed curl."$close

fi

command -v lolcat > /dev/null  && lolcat=true || lolcat=false

if [[ $lolcat == true ]];then

sleep 2

echo

echo -e $yellow "-$green You have already installed lolcat.$close"

echo

else

apt-get install ruby -y > /dev/null 2>&1 &

wget https://github.com/busyloop/lolcat/archive/master.zip > /dev/null 2>&1 &

unzip master.zip

cd lolcat-master/bin

gem install lolcat

echo -e $yellow "    Now$green lolcat$yellow Installing...."

sleep 5

echo -e $yellow "    Just wait a minute...."

sleep 5

loading

rm -rf master*

echo -e $green "    You have just installed lolcat."$close

sleep 5

echo

fi

cd ..
