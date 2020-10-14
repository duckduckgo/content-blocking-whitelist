#!/bin/bash
# may need to chmod 700 easyAllowlist.sh to run
wget https://raw.githubusercontent.com/easylist/easylist/master/easylist/easylist_allowlist.txt https://raw.githubusercontent.com/easylist/easylist/master/easyprivacy/easyprivacy_allowlist.txt https://raw.githubusercontent.com/easylist/easylist/master/easylist_adult/adult_allowlist.txt https://raw.githubusercontent.com/easylist/easylist/master/easyprivacy/easyprivacy_allowlist_international.txt
# clear easylist allowlists
sed -i.bak '/!-----EasyPrivacy Allowlist Start-----!/,/!-----EasyList Adult Allowlist End-----!/d' trackers-allowlist.txt
# add easyprivacy allowlist
echo '!-----EasyPrivacy Allowlist Start-----!' >> trackers-allowlist.txt
sed -e 's/@@//' easyprivacy_allowlist.txt >> trackers-allowlist.txt
echo '!-----EasyPrivacy Allowlist End-----!' >> trackers-allowlist.txt
# add easyprivacy allowlist
echo '!-----EasyPrivacy International Allowlist Start-----!' >> trackers-allowlist.txt
sed -e 's/@@//' easyprivacy_allowlist_international.txt >> trackers-allowlist.txt
echo '!-----EasyPrivacy International Allowlist End-----!' >> trackers-allowlist.txt
# add easylist allowlist
echo '!-----EasyList Allowlist Start-----!' >> trackers-allowlist.txt
sed -e 's/@@//' easylist_allowlist.txt >> trackers-allowlist.txt
echo '!-----EasyList Allowlist End-----!' >> trackers-allowlist.txt
# add easylist adult allowlist
echo '!-----EasyList Adult Allowlist Start-----!' >> trackers-allowlist.txt
sed -e 's/@@//' adult_allowlist.txt >> trackers-allowlist.txt
echo '!-----EasyList Adult Allowlist End-----!' >> trackers-allowlist.txt
# remove media request type from rules until we support them
sed -i.bak 's/media,//' trackers-allowlist.txt
# remove extra files
rm easylist_allowlist.txt adult_allowlist.txt easyprivacy_allowlist.txt easyprivacy_allowlist_international.txt trackers-allowlist.txt.bak
