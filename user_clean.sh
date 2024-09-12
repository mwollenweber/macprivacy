#!/bin/bash
# Matthew Wollenweber
# mjw@insomniac.tech

unalias rm
setopt rm_star_silent


qlmanage -r cache
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
defaults delete ~/Library/Preferences/com.apple.finder GoToField
defaults delete ~/Library/Preferences/com.apple.finder GoToFieldHistory
defaults delete ~/Library/Preferences/com.apple.finder RecentSearches
defaults delete ~/Library/Preferences/com.apple.finder FXDesktopVolumePositions
defaults delete ~/Library/Preferences/com.apple.finder FXRecentFolders
defaults delete ~/Library/Preferences/com.apple.finder RecentMoveAndCopyDestinations
defaults delete ~/Library/Preferences/com.apple.finder SGTRecentFileSearches
defaults delete ~/Library/Preferences/com.apple.safari RecentWebSearches
defaults delete ~/Library/Preferences/com.apple.Preview.LSSharedFileList RecentDocuments
defaults delete ~/Library/Preferences/com.apple.iPod.plist "conn:128:Last Connect"
defaults delete ~/Library/Preferences/com.apple.iPod.plist Devices
defaults delete ~/Library/Preferences/com.apple.dock "recent-apps"
defaults delete ~/Library/Preferences/com.apple.iTunes.plist recentSearches
defaults delete ~/Library/Containers/com.apple.QuickTimePlayerX/Data/Library/Preferences/com.apple.QuickTimePlayerX.plist
defaults delete ~/Library/Preferences/com.apple.wifi.WiFiAgent.plist UserDismissedLimitedNetworkFirstJoins
defaults delete ~/Library/Preferences/com.apple.weather.sensitive.plist privateUserIdentifier
defaults delete ~/Library/Preferences/com.apple.weather.sensitive.plist userIdentifier
defaults delete ~/Library/Preferences/com.vmware.fusionStartMenu.plist fusionStartMenuVmList
defaults delete ~/Library/Preferences/com.vmware.fusion.plist "PLInventory Selection"
defaults delete NSGlobalDomain NSNavRecentPlaces
defaults delete com.apple.Preview.LSSharedFileList RecentDocuments

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


rm -rf ~/.Trash/*
rm -rf  ~/Library/Logs/*
rm -rf ~/Library/Cookies/*
rm -rf  ~/Library/Application\ Support/CrashReporter/*
rm -rf ~/Library/Safari/LocalStorage/*
rm -rf ~/Library/Safari/Databases/*
rm  ~/Library/Application\ Support/Google/Chrome/Default/Cookies/*
rm -rf ~/Library/Caches/Google/Chrome/*
rm -rf ~/Library/Caches/com.apple.Spotlight/*
rm -rf ~/Library/Caches/com.apple.Safari/*
rm -rf  ~/Library/Caches/com.apple.preferencepanes.usercache/*
rm -rf ~/.sqlite_history
rm -rf ~/.bash_history
rm -rf ~/.psql_history
rm -rf ~/.python_history
rm -rf ~/.zsh_history
rm -rf ~/.zsh_sessions/*
rm -rf ~/.lesshst
rm -rf ~/Library/Application\ Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/*
rm ~/Library/Preferences/*LSSharedFileList.plist
rm -rf ~/Library/Caches/Google/Chrome/Default/*
rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/*
rm -rf ~/Library/Safari/History*
rm -rf /private/var/tmp/com.apple.messages
rm -rfv $(getconf DARWIN_USER_CACHE_DIR)/com.apple.QuickLook.thumbnailcache/exclusive
rm -rfv $(getconf DARWIN_USER_CACHE_DIR)/com.apple.QuickLook.thumbnailcache/index.sqlite
rm -rfv $(getconf DARWIN_USER_CACHE_DIR)/com.apple.QuickLook.thumbnailcache/index.sqlite-shm
rm -rfv $(getconf DARWIN_USER_CACHE_DIR)/com.apple.QuickLook.thumbnailcache/index.sqlite-wal
rm -rfv $(getconf DARWIN_USER_CACHE_DIR)/com.apple.QuickLook.thumbnailcache/resetreason
rm -rfv $(getconf DARWIN_USER_CACHE_DIR)/com.apple.QuickLook.thumbnailcache/thumbnails.data
rm -rfv "~/Library/LanguageModeling/*" "~/Library/Spelling/*" "~/Library/Suggestions/*"
rm -rfv "~/Library/Application Support/Quick Look/*"
rm -rfv "~/Library/Autosave Information"
rm -rfv ~/Library/Saved\ Application\ State/*
rm -rfv ~/Library/Assistant/SiriAnalytics.db


find ~/Downloads/ -type f -exec xattr -d com.apple.metadata:kMDItemWhereFroms {} \;
find ~/Downloads/ -type f -exec xattr -d com.apple.quarantine  {} \;

#Warning this is aggressive
find  ~/Library/Caches -type f -mtime +1 -exec rm {} \;

#Applications Caches
for x in $(ls ~/Library/Containers/)
do
    #echo "Cleaning ~/Library/Containers/$x/Data/Library/Caches/"
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/*
done


history -c
history -p
