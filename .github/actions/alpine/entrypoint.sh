#!/usr/bin/env sh

#addgroup -g $(stat -c "%g" .) docker
#adduser -D -G docker -g 'Alpine Package Builder' -u $(stat -c "%u" .) -s /bin/ash runner 
#adduser runner abuild
export REPODEST="${GITHUB_WORKSPACE}/packages"
export SRCDEST="${GITHUB_WORKSPACE}/cache/distfiles"
export PACKAGER_PRIVKEY="/root/key.rsa"
printf "${INPUT_ABUILD_KEY}" > "${PACKAGER_PRIVKEY}"
#su runner -c 'abuild-keygen -n -a'
#su runner -c 'abuild checksum'
#su runner -c 'abuild -r'
abuild -F checksum
abuild -F -r