#!/bin/bash
date=$(date '+%Y.%m.%d..%H.%M.%S')
dn="$date.png"
cd "/home/carrot/ss"
import "$dn";xclip -selection clipboard -t "image/png" < "$dn"
