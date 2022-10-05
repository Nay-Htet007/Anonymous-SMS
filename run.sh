#data/data/com.termux/files/usr/bin/bash
clear
red='\e[1;31m'
non='\e[0m'
yellow='\e[1;33m'
lb='\e[6;34m'
bash .dir/banner.sh
home () {
echo -e "                 \e[1;35m---[[  \e[4;32mWelcome To Anonymous-SMS\e[0m]  \e[1;35m]]---\e[0m"
echo ""
echo -e "               ($red 1 $non) Installation Requirements (packages)"
echo ""
echo -e "               ($red 2 $non) Sending SMS"
echo ""
echo -e "               ($red 3 $non) Exit"
echo ""
echo -e "$lb### $red Warning!!$non$yellow You need to first install requirements untill send.$non$lb ###"
echo
read -p $' Choose \e[1;31m >> \e[0m' choose
}
home
choose () {
case $choose in
1)
cd .dir
bash requirement.sh
cd ..
bash run.sh
;;
2)
command -v wget && command -v curl && command -v lolcat && run=true || run=false
if [[ $run == true ]]; then
cd .dir
bash sms.sh
else
cd .dir
bash requirement.sh
cd ..
bash run.sh
fi
;;
3)
exit
;;
*)
bash run.sh
esac
}
choose
