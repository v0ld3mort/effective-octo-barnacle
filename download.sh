apt -y install sipcalc nmap isc-dhcp-server dhcpd lighttpd beef-xss bettercap hostapd-wpe hostapd
wget https://raw.githubusercontent.com/v0ld3mort/effective-octo-barnacle/main/hack-captive.sh
chmod u+x hack-captive.sh
rm download.sh
sudo ./hack-captive.sh
