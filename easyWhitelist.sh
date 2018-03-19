#!/bin/bash
# may need to chmod 700 easyWhitelist.sh to run
wget https://raw.githubusercontent.com/easylist/easylist/master/easylist/easylist_whitelist.txt https://raw.githubusercontent.com/easylist/easylist/master/easyprivacy/easyprivacy_whitelist.txt https://raw.githubusercontent.com/easylist/easylist/master/easylist_adult/adult_whitelist.txt https://raw.githubusercontent.com/easylist/easylist/master/easyprivacy/easyprivacy_whitelist_international.txt
# clear easylist whitelists
sed -i.bak '/!-----EasyPrivacy Whitelist Start-----!/,/!-----EasyList Adult Whitelist End-----!/d' trackers-whitelist.txt
# add easyprivacy whitelist
echo '!-----EasyPrivacy Whitelist Start-----!' >> trackers-whitelist.txt
sed -e 's/@@//' easyprivacy_whitelist.txt >> trackers-whitelist.txt
echo '!-----EasyPrivacy Whitelist End-----!' >> trackers-whitelist.txt
# add easyprivacy whitelist
echo '!-----EasyPrivacy International Whitelist Start-----!' >> trackers-whitelist.txt
sed -e 's/@@//' easyprivacy_whitelist_international.txt >> trackers-whitelist.txt
echo '!-----EasyPrivacy International Whitelist End-----!' >> trackers-whitelist.txt
# add easylist whitelist
echo '!-----EasyList Whitelist Start-----!' >> trackers-whitelist.txt
sed -e 's/@@//' easylist_whitelist.txt >> trackers-whitelist.txt
echo '!-----EasyList Whitelist End-----!' >> trackers-whitelist.txt
# add easylist adult whitelist
echo '!-----EasyList Adult Whitelist Start-----!' >> trackers-whitelist.txt
sed -e 's/@@//' adult_whitelist.txt >> trackers-whitelist.txt
echo '!-----EasyList Adult Whitelist End-----!' >> trackers-whitelist.txt
# remove extra files
rm easylist_whitelist.txt adult_whitelist.txt easyprivacy_whitelist.txt easyprivacy_whitelist_international.txt trackers-whitelist.txt.bak
