#!/usr/bin/env sh

#addgroup -g $(stat -c "%g" .) docker
#adduser -D -G docker -g 'Alpine Package Builder' -u $(stat -c "%u" .) -s /bin/ash runner 
#adduser runner abuild
export REPODEST="${GITHUB_WORKSPACE}/packages"
export SRCDEST="${GITHUB_WORKSPACE}/cache/distfiles"
export PACKAGER_PRIVKEY="/root/${INPUT_ABUILD_KEY_NAME}.rsa"
export PACKAGER_PUBKEY="/root/${INPUT_ABUILD_KEY_NAME}.rsa.pub"
printf "${INPUT_ABUILD_KEY}" > "${PACKAGER_PRIVKEY}"
printf "${INPUT_ABUILD_KEY_PUB}" > "${PACKAGER_PUBKEY}"
cp "${PACKAGER_PUBKEY}" /etc/apk/keys/
#su runner -c 'abuild-keygen -n -a'
#su runner -c 'abuild checksum'
#su runner -c 'abuild -r'
abuild -F checksum
abuild -F -r
apk verify $REPODEST/x86_64/certcli-*