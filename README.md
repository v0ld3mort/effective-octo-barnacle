## effective-octo-barnacle
### Captive portal session hijack

#### Instructions:
1. Read/download `download.sh`, this is a simple bash script that can be copy+pasted into a terminal or simply ran from the terminal. 

2. Once downloaded, change the file to be executable:
`
sudo chmod +x download.sh
`

3. And run with:
`./download.sh
`

The file will download the required repositories, software, and start the captive portal session hijack attempt. 

As each network differs slightly, it would be best practise to test at different times to ensure you can hijack a session anytime.

### Captive Portal Cred Sniffing
This method is simple to execute, however relies upon a couple of parameters:
  - The captive portal must not be using encryption (i.e. SSL/TLS),
  - You must have a sniffer up at the time of authentication by the user you are sniffing credentials fork,
  - Password hashing may be implemented,
  - Problems may arise if you are both logged in at the same time. 

### Instructions:
1. Start your listener with airdump or similar, looking for the channel the AP the captive portal is on:
`
sudo airodump-ng wlan0
`
2. Choose a close AP, you will be able to tell this by the strongest signal (PWR column in airodump) and one that is passing data.
3. Camp on that channel and start collecting packets:
`
sudo airodump-ng --channel 10 -w /root/capture wlan0
`

4. After letting this run for a while, we need to analyse our results in Wireshark.
Using display filters such as:
- `http`
- `frame matches username` (will match text contents in all sections of a frame - not case sensitive)
- `frame matches password`

### Evil Twin Attack
With an evil twin attack we are emulating the Wi-Fi network we want access to, in an attempt to get a client to connect to us, and enter their valid credentials which we will then use later. The easiest way to implement this is using `airgeddon`, a bash script for pentesting wireless networks. It has a lot of uses, but in this instance we will only be using it for an evil twin attack to get credentials. You will require 2 cards already in monitor mode for this - `airmon-ng start wlan0`
1. Install airgeddon with `sudo apt install airgeddon`
2. Ensuring your Wi-Fi card is in monitor mode, start airgeddon with `airgeddon`. Upon startup airgeddon will check essential and optional dependencies it will need. (hint: in brackets are the dependency names that can be installed with apt install <name>) You may not need them so we will just click through until we hit a point that we need them. 
3. The first menu will be to select a Wi-Fi card.
4. Next menu enter 7 corresponding to Evil Twin attacks menu.
5. And select 9, Evil Twin AP with captive portal. If there are any required dependencies yet to be installed this menu will be red, install and restart the program.
6. Upon starting another window will open with the AP scan happening, once you have seen the AP you want to emulate, click in this screen and press Ctl+c. The results will populate the original terminal window. 
7. Select your target, choose your method of deauthentication, if you have a handshake capture you will be asked for it and may be able to avoid the handshake capture attempt. 
8. Once a handshake has been captured, CTRL^C out of the window, you will now be asked to specify a file where the password for the captive portal will be saved. 
9. Choose your required language, multiple terminals will open, now sit back and wait, you'll be notified when a password comes in. 
