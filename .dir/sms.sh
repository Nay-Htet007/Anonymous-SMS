clear
echo -e '\e[6;37m    _____________________________________________________________\e[0m'
figlet '    Sending-SMS' | lolcat -a -d -s 25
echo
echo -e '\e[6;37m    _______________________              ________________________\e[0m'
echo -e '\e[6;37m    _______________________Coded By 0b170________________________\e[0m'
echo ""

#Color Variable
green='\e[1;32m'
gre='\e[0;32m'
red='\e[1;31m'
close='\e[0m'

datarequest () {
echo
echo
echo
read -p $'Enter your Country Code      (e.g-In Myanmar \e[1;33m+95\e[0m) :: ' cc
read -p "Enter your Target Phone Number (e.g- 09123456789) :: " tpn
read -p "Put the Message to $tpn :: " m
echo ""
datasend
}
datasend () {
#datarequest=$(curl --silent -X POST https://textbelt.com/text \
#      --data-urlencode phone= \
#      --data-urlencode message=Fuck!Bitch,Don't Steal My Code \
#      -d key=textbelt)
output=$(curl --silent -X POST https://textbelt.com/text --data-urlencode phone="$cc$tpn" --data-urlencode message="$m" -d key=textbelt)
dataresponse
}

dataresponse () {
echo -e $gre
echo -ne 'Sending.                             (10%)\r'
sleep 1
echo -ne 'Sending..                            (20%)\r'
sleep 1
echo -ne 'Sending....                          (40%)\r'
sleep 1
echo -ne 'Sending......                        (60%)\r'
sleep 1
echo -ne 'Sending........                      (80%)\r'
sleep 1
echo -ne 'Sending..........                    (100%)\r'
echo -ne '\n'$close
if grep -q true <<< "$output"; then
  echo ""
  echo -e $green
  figlet Successful...
  echo -e $close
  echo -e "Your Target Number - " $gre$cc$tpn$close
  echo -e "Your Message       - " $gre$m$close
  echo ""
  echo -e $green "Your Message Sending is success." $close
  echo ""
else
  echo ""
  echo -e $red
  figlet Failed...
  echo -e $close
  echo -e "Your Target Number - " $gre$cc$tpn$close
  echo -e "Your Message       - " $gre$m$close
  echo ""
  echo -e $red"Your Message Sending is failed."$close
  echo ""
fi
again
}

again () {
read -p "Do you wanna sent again(y/n) :: " yn
if [[ "$yn" == "y" || "$yn" == "yes" ]]; then
  bash sms.sh
else
  exit
fi
}
datarequest
cd ..
