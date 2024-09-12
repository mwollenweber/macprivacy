#!/bin/bash
# Matthew Wollenweber
# mjw@insomniac.tech

unalias rm
setopt rm_star_silent

if [[ $UID == 0 || $EUID == 0 ]]; then
  echo "I'm root"
  log erase --all
  dscacheutil -flushcache; sudo killall -HUP mDNSResponder
  defaults delete /Library/Preferences/com.apple.iPod.plist "conn:128:Last Connect"
  defaults delete /Library/Preferences/com.apple.iPod.plist Devices
  defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES
  defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
  defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

  rm -rfv /var/db/lockdown/*


  find /tmp -type f  -mtime +1 -exec rm {} \;
  find /Library/Logs/ -type f  -mtime +1 -exec rm {} \;
  find /var/log/ -type f  -mtime +1 -exec rm {} \;
  find /var/logs/ -type f  -mtime +1 -exec rm {} \;
  find /Library/Logs/DiagnosticReports/ -type f  -mtime +1 -exec rm {} \;

  rm -rfv /var/spool/cups/c0*
  rm -rfv /var/spool/cups/tmp/*
  rm -rfv /var/spool/cups/cache/job.cache*

  rm -rf /var/db/CoreDuet/*
  rm -rf /var/db/diagnostics/*
  rm -rf /var/db/systemstats/*
  rm -rf /var/db/uuidtext/*
  rm -rf /var/log/DiagnosticMessages/*
  rm -rf /private/var/db/diagnostics/*/*

fi
