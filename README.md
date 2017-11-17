# tvheadend_scripts
These are some scripts I made a couple years ago to use with Tvheadend, running on an ubuntu 14.04 instance.

All of my recordings go to `/home/hts/recordings/` (which is a mounted nfs share from my nas)


# cleanup.sh

This script will delete the entire folder for the given show name, add it to cron as shown below. I also do a service restart every day so that the filesystem is rescanned.

## Sample crontab entries to use the cleanup script

```
1 6 * * * /home/hts/cleanup.sh Action-News 2>&1 /home/hts/logs/cleanup.log
1 4 * * * /usr/sbin/service tvheadend restart > /var/log/tvheadend_restart.log 2>&1
```

# convert.sh

This script is ran as the Post-Processor Command within the Tvheadend gui (Configuration > Recording > Digital Video Renderer Profiles)

# dircleanup.sh

This script will delete any episode comskip files (files that end in .txt) for episodes that have been deleted via the application

# rename.sh

I made this script because, for some reason that I can't remember, I was getting files with .ts.mkv extensions, and this renamed them to just .mkv
