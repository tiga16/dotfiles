rm -f /home/ssnape/.tmp/screenshot.png
scrot -z /home/ssnape/.tmp/screenshot.png
convert /home/ssnape/.tmp/screenshot.png -paint 0x4 -blur 0x4 /home/ssnape/.tmp/screenshot.png
i3lock -e -t -i /home/ssnape/.tmp/screenshot.png
