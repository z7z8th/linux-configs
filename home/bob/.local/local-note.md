Install
===
cd ~/Downloads/
axel -o firefox-beta-latest.tar.bz2 -a -n4 'https://download.mozilla.org/?product=firefox-beta-latest&os=linux64&lang=en-US
tar xf firefox-beta-latest.tar.bz2 -C ~/.local/share/

axel -a -n4 https://go.microsoft.com/fwlink/?LinkID=620884
tar xf code-stable-xxxx.tar.gz -C ~/.local/share/

Icons
===
xdg-icon-resource install --novendor --size 128 ~/.local/share/firefox/browser/chrome/icons/default/default128.png firefox
xdg-icon-resource install --novendor --size 128 ~/.local/share/VSCode-linux-x64/resources/app/resources/linux/code.png com.visualstudio.code

Gnome
===
gsettings set org.gnome.desktop.session idle-delay 1200    # blank screen after 20 minutes idle
gsettings set org.gnome.desktop.screensaver lock-delay 0    # lock immediately after blank
