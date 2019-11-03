#Write Speed
dd if=/dev/zero of=~/test.tmp bs=500K count=1024

#Read Speed
dd if=~/test.tmp of=/dev/null bs=500K count=1024