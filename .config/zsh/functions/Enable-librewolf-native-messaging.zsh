
# By default native-messaging doesn't worn in Librewolf, resulting extension-native app breakage
# To overcome this we need to create symlinks to firefox directories....

function create_librewolf_ntvehst {
    mkdir -p .mozilla/native-messaging-hosts/
    ln -s ~/.mozilla/native-messaging-hosts ~/.librewolf/native-messaging-hosts
    sudo mkdir -p /usr/lib/librewolf/
    sudo ln -s /usr/lib/mozilla/native-messaging-hosts /usr/lib/librewolf/native-messaging-hosts
}
