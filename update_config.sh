#!/bin/bash
# Matthew Wollenweber
# mjw@insomniac.tech


#various configs that I like
chmod -R 000 ~/Library/Saved\ Application\ State/
chflags -R uchg ~/Library/Saved\ Application\ State/
chmod -R 000 ~/Library/Assistant/SiriAnalytics.db
chflags -R uchg ~/Library/Assistant/SiriAnalytics.db
chflags nohidden ~/Library
chmod -R 000 "~/Library/Application Support/Quick Look"
chflags -R uchg "~/Library/Application Support/Quick Look"
chmod -R 000 ~/Library/LanguageModeling ~/Library/Spelling ~/Library/Suggestions
chflags -R uchg ~/Library/LanguageModeling ~/Library/Spelling ~/Library/Suggestions

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowPathbar -bool true

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.MobileSMS.plist KeepMessageForDays 30;
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari HistoryAgeInDaysLimit 31
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false

defaults write com.apple.commerce AutoUpdate -bool true
