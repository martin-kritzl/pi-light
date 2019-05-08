systemctl enable ssh
apt-get update
apt-get	install scons python-numpy python-scipy python-pyaudio swig jackd2
pip3 install rpi_ws281x


# http://anleitung.joy-it.net/wp-content/uploads/2017/04/RB-TFT3.2_RB-TFT3.5_Anleitung_09-01-2019-1.pdf
/boot/config.txt
dtparam=spi=on
dtoverlay=joy-IT-Display-Driver-32b-overlay:rotate=270,swapxy=1

/boot/cmdline.txt
fbcon=map:10

/usr/share/X11/xorg.conf.d/99-calibration.conf
Section "InputClass"
Identifier      "calibration"
MatchProduct    "ADS7846 Touchscreen"
Option  "Calibration"   "160 3723 3896 181"
Option  "SwapAxes"      "0"
EndSection

/usr/share/X11/xorg.conf.d/99-fbturbo.conf
Option "fbdev" "/dev/fb1"

cd /tmp
wget anleitung.joy-it.net/upload/joy-IT-Display-Driver-32b-overlay.dtb
cp joy-IT-Display-Driver-32b-overlay.dtb /boot/overlays/joy-IT-Display-Driver-32b-overlay.dtbo

apt-get install xserver-xorg-input-evdev
cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf



#https://tutorials-raspberrypi.com/connect-control-raspberry-pi-ws2812-rgb-led-strips/
sudo nano /etc/modprobe.d/snd-blacklist.conf
blacklist snd_bcm2835

sudo nano /boot/config.txt
#dtparam=audio=on