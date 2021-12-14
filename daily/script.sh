##install sudo apt install libxml2-utils apache2 w3m fonts-open-sans
#!/bin/bash
#clear
AQUI=$PWD
eu=$(whoami)
Route="/home/$eu/.conky/daily"
YEAR=$(date '+%Y')
MONTH=$(date '+%m')
DAY=$(date '+%d')
nDAY=$(date '+%A')
USRAGT="Mozilla/5.0 (X11; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0 PaleMoon/29.3.0"
wLang=$(echo $LANG | awk -F "." '{print $1}' | awk -F "_" '{print $1}')
if [ -f $Route/language ]; then troca=troca; else echo $wLang > $Route/language; fi
wLang=$(cat $Route/language)
wget https://wol.jw.org/ -q -c --user-agent="$USRAGT" -O /tmp/analisis.html
#echo $wLang
LinKmain=$(cat /tmp/analisis.html | grep 'hreflang="'$wLang'"' | awk -F '"' '{print $10}')
LADD=https://wol.jw.org$LinKmain/$YEAR/$MONTH/$DAY
#echo $LADD
wget $LADD --user-agent="$USRAGT" -q -c -O /tmp/today.html

xmllint --html --xpath '//h2' /tmp/today.html | sed -n 2p > /tmp/tt.htm
xmllint --html --xpath '//p[@class="themeScrp"]' /tmp/today.html | sed -n 2p > /tmp/t1.htm
xmllint --html --xpath '//p[@class="sb"]' /tmp/today.html  | sed -n 2p > /tmp/c1.htm
#clear
cp /tmp/tt.htm /var/www/html/txtdaily
cp /tmp/t1.htm /var/www/html/txtdaily
cp /tmp/c1.htm /var/www/html/txtdaily

w3m http://localhost/txtdaily/tt.htm > /tmp/dayh
w3m http://localhost/txtdaily/t1.htm > /tmp/daytxt
w3m http://localhost/txtdaily/c1.htm > /tmp/daycomm
#cp /tmp/daytt $Route/daytt

tr '\n' ' ' < /tmp/dayh > /tmp/dayh
tr '\n' ' ' < /tmp/daytxt > /tmp/dayt
tr '\n' ' ' < /tmp/daycomm > /tmp/dayc
rm /tmp/analisis.html /tmp/today.html /var/www/html/txtdaily/tt.htm /var/www/html/txtdaily/t1.htm /var/www/html/txtdaily/c1.htm /tmp/tt.htm /tmp/t1.htm /tmp/c1.htm /tmp/dayh /tmp/daytxt /tmp/daycomm
