## effective-octo-barnacle
### Captive portal session hijack

#### Instructions:
Read/download `download.sh`, this is a simple bash script that can be copy+pasted into a terminal or simply ran from the terminal. 

Once downloaded, change the file to be executable:
`
sudo chmod +x download.sh
`

And run with:
`./download.sh
`

The file will download the required repositories, software, and start the captive portal session hijack attempt. 

As each network differs slightly, it would be best practise to test at different times to ensure you can hijack a session anytime.

### Captive Portal Cred Sniffing

### Instructions:
This method is simple to execute, however relies upon a couple of parameters:
  1. The captive portal must not be using encryption (i.e. SSL/TLS),
  2. You must have a sniffer up at the time of authentication by the user you are sniffing credentials fork,
  3. Password hashing may be implemented,
  4. Problems may arise if you are both logged in at the same time. 

Start your listener with airdump or similar, looking for the channel the AP the captive portal is on:
`
sudo airodump-ng wlan0
`
Choose a close AP, you will be able to tell this by the strongest signal (PWR column in airodump) and one that is passing data.
Camp on that channel and start collecting packets:
`
sudo airodump-ng --channel 10 -w /root/capture wlan0
`

After letting this run for a while, we need to analyse our results in Wireshark.
Using display filters such as:
- `http`
- `frame matches username` (will match text contents in all sections of a frame - not case sensitive)
- `frame matches password`
