---
aliases:
  - ios
  - macos
date: 2008-01-01T12:07:52Z
lang: en
tags: [ apple, ios, macos, info, tips, tricks, how to ]
title: Apple
summary: Small information nuggets and recipies about Apple OS’s
showToc: true
tocOpen: true
---

*(most recent on top)*

## List all registered url schemes

* [applications - What are all of the URI Schemes Available on macOS - Ask Different](https://apple.stackexchange.com/a/397188)

```
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump URLSchemeBinding
```

or, to make it more readily available:

```
alias lsregister='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister'
lsregister -dump URLSchemeBinding
```

## Access unicode characters for keyboard symbols

* [keyboard - Where can I find the unicode symbols for Mac functional keys? (Command, Shift, etc.) - Ask Different](https://apple.stackexchange.com/a/293486)

    > You can click the ⚙️ or (•••) button > **Customize List** and enable additional unicode characters groups, including **Code Tables > Unicode** which will show the full unicode table grouped by categories.
    >
    > The ⌘ ⇪⌥ ⏎ symbols are grouped under the **Symbols > Technical Symbols** category which you can enable for quick access

* Interesting categories to enable:
    - Symbols > Musical Symbols
    - Symbols > Signs and Standard Symbols
    - Symbols > Technical Symbol

## Link to Notes

* To find out the id of a Note use shortcut [Get URL of Note](https://showcuts.app/share/view/e370c4eacc7441a18e7ec95667b2e32f) (via [iBanks3](https://www.reddit.com/r/shortcuts/comments/aot272/get_url_of_note_copy_note_url_to_clipboard))

1. Run shortcut **Get URL of Note**
2. Enter node `Note` and check the `LNEntity` Supported Type to get the UUID, e.g.:

    ```xml
    <LNEntity: 0x123456789, identifier: NoteEntity/applenotes:note/12345678-abcd-bcde-cdef-123456789012, ...
    ```

    ➔`12345678-abcd-bcde-cdef-123456789012`

3. Convert the UUID to ALL CAPS (*for example, using [Convert Case](https://convertcase.net/) or the **Pages** app*):

    ➔`12345678-ABCD-BCDE-CDEF-123456789012`

4. Append it to the url sheme to open Notes:

    <mark>➔`applenotes://showNote?identifier=12345678-ABCD-BCDE-CDEF-123456789012`</mark>

*Note*: Sometimes you might get the following error:

> **An error occurred while running Get URL of Note**  
> Couldn't communicate with a helper application.

I haven’t found any way around it other than trying again some other time 🤷‍♂️ — restarts haven’t helped at all.

## Enable Touch ID for sudo

* [Quick Tip: Enable Touch ID for sudo – Six Colors](https://sixcolors.com/post/2020/11/quick-tip-enable-touch-id-for-sudo/)

```shell
cd /etc/pam.d/ && sudo chmod a+w sudo && vi sudo && sudo chmod a-w sudo && cd -
```

```shell
# sudo: auth account password session
auth       sufficient     pam_tid.so        # <= add this line here
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so
```

## Remove quarantine

*… “‘command’ cannot be opened because the developer cannot be verified.”*

```shell
xattr -d com.apple.quarantine /usr/local/bin/cmd
```

## File extended attributes

*… list attributes*

```shell
ls -l -@ file
xattr file
```

*… show values*

```shell
xattr -l file
xattr -p attribute file
```

## Add to sudoers without needing a restart

* [macos - How do I give a user sudo permissions? - Ask Different](https://apple.stackexchange.com/questions/76088/how-do-i-give-a-user-sudo-permissions/76096#76096)

```shell
su - admin
```

*… add*

```shell
sudo dseditgroup -o edit -a hugo -t user admin
sudo dseditgroup -o edit -a hugo -t user wheel
```

*… delete*

```shell
sudo dseditgroup -o edit -d hugo -t user admin
sudo dseditgroup -o edit -d hugo -t user wheel
```

## Create encrypted zip file

* [Creating AES256 encrypted Zip Archive Files on a Mac from the Command Line](http://www.koozie.org/blog/2014/08/creating-aes256-encrypted-zip-archive-files-mac-command-line/)
* [macosx - What encryption method is used by the zip program in macOS? - Information Security Stack Exchange](https://security.stackexchange.com/questions/186128/what-encryption-method-is-used-by-the-zip-program-in-macos/186132#186132)

*… install*

```shell
brew install p7zip
```

*… create*

```shell
7za a -tzip -mem=AES256 -p secrets-encrypted.zip secrets/
7za x secrets-encrypted.zip
```

## View and change file flags

*… invisible = `hidden`; visible = `nohidden`*

```shell
$ touch seeme hideme

$ chflags hidden hideme
$ chflags nohidden seeme

$ ls -lO *me  # -O is an “oh” not a “zero”
-rw-r--r--  1 hugo  staff  hidden 0 Mar 12 11:28 hideme
-rw-r--r--  1 hugo  staff  -      0 Mar 12 11:28 seeme
```

## Reset unlocking MacBook by Apple Watch

* In **Messages**
    - Preferences ➤ Accounts
    - Sign Out
    - Sign In
* In **System Preferences**
    - Security & Privacy
    - Check “Allow your Apple Watch to unlock you Mac”

## Why does it keep waking from sleep?

* [If your Mac doesn't sleep or wake when expected - Apple Support](https://support.apple.com/en-us/HT204760)
* [Determine Why Your Mac Wakes Up From Sleep](http://osxdaily.com/2010/07/17/why-mac-wakes-from-sleep/)

*… definition of log terms*

* **OHC** (Open Host Controller) is usually USB or Firewire. OHC1 or OHC2 is almost certainly an **external USB keyboard or mouse**
* **EHC** (Enhanced Host Controller) is another USB interface, but can also be **wireless devices and bluetooth**
* **USB** when a USB device woke the machine up
* **LID0** when you open the lid the machine wakes up from sleep
* **PWRB** (Power Button) which is the **physical power button** on your Mac
* **RTC** (Real Time Clock Alarm) is generally from **wake-on-demand services**
    - Schedule sleep and wake via the Energy Saver control panel
    - `launchd` setting
    - User applications
    - Backups
    - Other scheduled events

```shell
log show --last 1d --predicate 'eventMessage contains "Wake reason"'
log show --last 1d | grep -C15 -i "wake reason"
```

## Delete old Time Machine backups

* [macos - How can I manually delete old backups to free space for Time Machine? - Ask Different](https://apple.stackexchange.com/questions/39287/how-can-i-manually-delete-old-backups-to-free-space-for-time-machine/55646#55646)
* [time machine - Remove unnecessary backups from TimeMachine to get space - Ask Different](https://apple.stackexchange.com/a/404761)

```shell
tmutil listbackups
sudo tmutil delete /Volumes/[Disk]/Backups.backupdb/[Name]/2000-00-00-000000
sudo tmutil delete /Volumes/[Disk]/Backups.backupdb/[Name]/2000-*
```

## Use Keychain for unlocking SSH private key

* [terminal - macOS Sierra doesn’t seem to remember SSH keys between reboots - Ask Different](http://apple.stackexchange.com/questions/254468/macos-sierra-doesn-t-seem-to-remember-ssh-keys-between-reboots/264974#264974)

```shell
Host *
   AddKeysToAgent yes
   UseKeychain yes
   IdentityFile ~/.ssh/id_rsa
```

## Spoof MAC address

* [Change (Spoof) a MAC Address in OS X Mountain Lion & Mavericks](http://osxdaily.com/2012/03/01/change-mac-address-os-x/)

```shell
openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'  # make
sudo ifconfig en0 ether xx:xx:xx:xx:xx:xx  # set
ifconfig en0 |grep ether  # check
```

## Consult timestamps on Safari history

* [sqlite - What format is the Safari History.db history_visits.visit_time in? - Stack Overflow](http://stackoverflow.com/a/34546556/1380781)
* [See website visit time in Safari history - Ask Different](https://apple.stackexchange.com/a/313670/66527)

```shell
$ sqlite3 ~/Library/Safari/History.db
sqlite> .headers on
```

```sql
select datetime(v.visit_time + 978307200, 'unixepoch', 'localtime') as date, v.visit_time + 978307200 as epoch, v.visit_time, i.domain_expansion, i.url
from history_items i left join history_visits v on i.id = v.history_item
order by i.id desc
limit 100;
```

Quick one-liner to paste into the Terminal:

```shell
sqlite3 ~/Library/Safari/History.db "select datetime(v.visit_time + 978307200, 'unixepoch', 'localtime') as date, v.title, i.url from history_items i left join history_visits v on i.id = v.history_item order by v.visit_time desc;" | less
```

## Homebrew: Remove formula and its dependencies, if not in use

* [Add an option to `brew rm` to uninstall / remove a package, including all it's dependencies. · Issue #7465 · Homebrew/homebrew](https://github.com/Homebrew/homebrew/issues/7465#issuecomment-49252187)
* [beeftornado/homebrew-rmtree - Ruby](https://github.com/beeftornado/homebrew-rmtree)

*… installing command*

```shell
brew tap beeftornado/rmtree && brew install brew-rmtree
```

*… removing a formula*

```shell
brew rmtree --dry-run formula
```

## Homebrew: Show installed formulae and dependencies

*… top-level only*

```shell
brew leaves
```

*… all dependencies*

```shell
brew deps --installed [--tree]
```

*… what uses a dependency*

```shell
brew uses --installed --recursive formula
```

## Homebrew quick guide

* [homebrew/FAQ.md at master · Homebrew/homebrew · GitHub](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/FAQ.md#faq)

*… installed things*

```shell
brew list
```

*… bumping version*

```shell
brew update                       # Homebrew itself
brew outdated                     # Formulas
brew upgrade [$FORMULA]           # Formulas
```

*… clearing things*

```shell
brew list --versions --multiple
brew cleanup -n                   # dry run
brew cleanup [$FORMULA]
```

## Homebrew: Using Caskroom sources

* [Homebrew Cask](http://caskroom.io/)

```shell
brew tap caskroom/cask
brew cask info Caskroom/cask/rowanj-gitx
```

## Test and debug LaunchAgents and LaunchDaemons

* [OSX launchd and launchctl issues - Tim's blag](http://tim.vanwerkhoven.org/post/2011/11/17/OSX-launchd-and-launchctl-issues)

```shell
sudo launchctl log level debug
tail -f /var/log/system.log
sudo launchctl log level error
```

```shell
launchctl list [cc.ferreira.backlog.daily]
launchctl start cc.ferreira.backlog.daily
```

```shell
launchctl unload -w ~/Library/LaunchAgents/cc.ferreira.backlog.daily.plist 
launchctl load -w ~/Library/LaunchAgents/cc.ferreira.backlog.daily.plist 
```

## Resolve host from IP

* *with zeroconf / Multicast DNS / mDNS*

```shell
dig +short -x 192.168.1.65 -p 5353 @224.0.0.251
```

## Disable/revoke disk decryption from a user

* *for FileVault 2*
* [osx - Disable a user's ability to unlock a FileVault 2 volume at startup/login time - Ask Different](http://apple.stackexchange.com/questions/18358/disable-a-users-ability-to-unlock-a-filevault-2-volume-at-startup-login-time/53803#53803)
* [Prevent certain accounts from unlocking FileVault 2 | TUAW - The Unofficial Apple Weblog](http://www.tuaw.com/2011/12/12/prevent-certain-accounts-from-unlocking-filevault-2/)

```shell
$ sudo su - testing  
$ passwd 
Changing password for charlie.
Old Password:                     # [enter old password here]
New Password:                     # [press enter]
Retype New Password:              # [press enter]
```

* System Preferences ➤ Security & Privacy ➤ FileVault
    - Enable Users …
    - Set Password …

## Create user manually without disk encryption rights

* *for FileVault 2*

```shell
sudo dscl /Local/Default -create /Users/testing
sudo dscl /Local/Default -create /Users/testing UserShell /bin/bash
sudo dscl /Local/Default -create /Users/testing RealName "Testing"
sudo dscl /Local/Default -create /Users/testing UniqueID 503
sudo dscl /Local/Default -create /Users/testing PrimaryGroupID 1000
sudo dscl /Local/Default -create /Users/testing NFSHomeDirectory /Users/testing
sudo passwd testing
```

## Check user definitions

```shell
sudo dscl /Local/Default -read /Users/testing
```

## Where the modem passwords are stored

```shell
cat /Library/Preferences/SystemConfiguration/preferences.plist
```

## Where the dhcp leases are stored

```shell
cat /var/db/dhcpd_leases
```

## Flush DNS cache

```shell
sudo dscacheutil -flushcache
```

## Force Spotlight to re-index

* [Spotlight: How to re-index folders or volumes](http://support.apple.com/kb/HT2409)

```shell
sudo mdutil -E /
```

## Remove duplicates in the "Open With" menu

```shell
cd /System/Library/Frameworks/ApplicationServices.framework/\Frameworks/LaunchServices.framework/Support/
lsregister -kill -r -domain local -domain system -domain user
```

## ~~View resource forks~~

```shell
# DEPRECATED: ls -l path/to/file/rsrc
```

## MySQL server

*… MacPorts*

```shell
su - admin -c "sudo mysql.server start | stop | …"
```

*… Homebrew*

```shell
su - admin; mysql.server start | stop | …
```

## iPhoto speedup

```shell
cd Pictures/iPhoto\ Library/
for db in *.db; do
    sqlite3 $db "vacuum;"
done
```

## Stop nmbd

```shell
sudo launchctl unload /System/Library/LaunchDaemons/nmbd.plist
```

## Quit application

```shell
osascript -e 'tell app "iCal" to quit'
```

## “Old” style sleep mode

```shell
pmset -g | grep hibernatemode
sudo pmset -a hibernatemode 0
```

## Eject cd

```shell
drutil tray eject
```

## Text styles and substitutions

```shell
open ~/Library/Preferences/.GlobalPreferences.plist
# See `NSFavoriteStyles`
# See `NSUserReplacementItems`
```

## Open man pages in PDF

```shell
man -t opensnoop | open -f -a /Applications/Preview.app
```

## Start/Stop local FTP Server

```shell
sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist
```

```shell
sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist
```
