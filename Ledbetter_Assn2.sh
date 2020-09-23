#! /bin/bash

# create child bash script
touch child.sh
#make scipt executable
chmod u+rwx child.sh
#write the bash line to script
echo '#! /bin/bash' >>child.sh
#write function for creating output file header to script
echo 'grep ID BTS_data.txt | column -t >output' >>child.sh

#write function for desired output to script
echo 'for x in {10..89}; do grep 13BTS0$x BTS_data.txt; done | cut -f1,2,4 | sort -r -n -k3 | column -t >>output' >>child.sh
#check to make sure it worked
echo 'head output' >>child.sh
#compress output
echo 'gzip output' >>child.sh


./child.sh
