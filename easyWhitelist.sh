#!/bin/bash
# may need to chmod 700 easyWhitelist.sh to run
wget https://raw.githubusercontent.com/easylist/easylist/master/easylist/easylist_whitelist.txt && wget https://raw.githubusercontent.com/easylist/easylist/master/easyprivacy/easyprivacy_whitelist.txt
# clear easylist whitelists
sed -i'' '/!-----EasyPrivacy Whitelist Start-----!/,/!-----EasyList Whitelist End-----!/d' trackers-whitelist.txt
# add easyprivacy whitelist
echo '!-----EasyPrivacy Whitelist Start-----!' >> trackers-whitelist.txt
sed -e 's/@@//' easyprivacy_whitelist.txt >> trackers-whitelist.txt
echo '!-----EasyPrivacy Whitelist End-----!' >> trackers-whitelist.txt
# add easylist whitelist
echo '!-----EasyList Whitelist Start-----!' >> trackers-whitelist.txt
sed -e 's/@@//' easylist_whitelist.txt >> trackers-whitelist.txt
echo '!-----EasyList Whitelist End-----!' >> trackers-whitelist.txt
# remove files
rm easylist_whitelist.txt && rm easyprivacy_whitelist.txt
